import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/app/moduels/auth/data/model/register_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// import 'package:flutter_facebook_sdk/flutter_facebook_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../services/locator_service.dart';
import '../../../data/repo/auth_repositore.dart';
import '../../../data/repo/validation_repo.dart';

part 'register_state.dart';

// import 'com.facebook.FacebookSdk';
// import 'com.facebook.appevents.AppEventsLogger';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final authRepository = gt<AuthRepo>();
  final validationRepo = gt<AuthValidationRepo>();
  final registerFirebase = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  // final facebookLogin=FlutterFacebookSdk();
  GoogleSignInAccount? googleAccount;
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  bool isInputFieldsValid = true;

  // late  RegisterModel registerModel;
  RegisterDto get userData => RegisterDto(
        name: fullNameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        email: emailController.text,
      );

  Future<void> registerWithForm() async {
    if (!isValidForm) return;
    emit(RegisterLoading());
    try {
      log(userData.toString());
      await authRepository.register(userData);
      emit(RegisterSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(RegisterError(message: e.toString()));
    }
  }

  Future<void> registerWithGmail() async {
    emit(RegisterLoading());
    googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      try {
        final registerResult =
            await registerFirebase.createUserWithEmailAndPassword(
                email: googleAccount!.email, password: googleAccount!.id);
        log(registerResult.user!.uid);

        emit(RegisterSuccess());
      } catch (e, s) {
        emit(RegisterError(message: e.toString()));
        log('Error in Register :$e', stackTrace: s);
      }
    } else {
      emit(RegisterError(message: 'no account found'));
    }
  }

  Future<void> registerWithFaceBook() async {
    emit(RegisterLoading());
    try {
      FacebookAuth.instance.login(permissions: ["public_profile", "email"]);
      final accessToken = FacebookAuth.instance.accessToken;

      FacebookAuth.instance.getUserData().then((userData) {
        log(userData.toString());
        fillRegisterData(userData);
      });
      emit(RegisterWithFaceBookSuccess());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(RegisterError(message: e.toString()));
    }
  }

  Future<void> logOutWithFaceBook() async {
    emit(LogoutWithFacebookSuccess());
    FacebookAuth.instance.logOut();
  }

  // loggOut() async {
  //   googleAccount = await _googleSignIn.signOut();
  //   emit(SignOutWithGoogleSuccess());
  // }
  String? validateFullName(String? value) =>
      validationRepo.validateFullName(value);

  String? validatePhoneNumber(String? value) =>
      validationRepo.validatePhoneNumber(value);

  String? validateEmail(String? value) => validationRepo.validateEmail(value);

  String? validatePassword(String? value) =>
      validationRepo.validatePassword(value);

  String? validateRePassword() => validationRepo.validateRePassword(
        passwordController.text,
        rePasswordController.text,
      );

  bool get isValidForm {
    if (registerFormKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  void fillRegisterData(Map<String, dynamic> userData) {
    fullNameController.text = userData['name'];
    emailController.text = userData['email'];
    passwordController.text = userData['id'];
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    emailController.dispose();
    return super.close();
  }
}
