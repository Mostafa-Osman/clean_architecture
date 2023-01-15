import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// import 'package:flutter_facebook_sdk/flutter_facebook_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../services/locator_service.dart';
import '../../../data/repo/validation_repository.dart';

part 'register_state.dart';

// import 'com.facebook.FacebookSdk';
// import 'com.facebook.appevents.AppEventsLogger';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
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

  Future<void> registerWithGmail() async {
    emit(RegisterWithGmailLoading());
    googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      try {
        final registerResult =
            await registerFirebase.createUserWithEmailAndPassword(
                email: googleAccount!.email, password: googleAccount!.id);
        log(registerResult.user!.uid);
        emit(RegisterWithGmailSuccess());
      } catch (e, s) {
        emit(RegisterWithGmailError(message: e.toString()));
        log('Error in Register :$e', stackTrace: s);
      }
    } else {
      emit(RegisterWithGmailError(message: 'no account found'));
    }
  }

  Future<void> registerWithFaceBook() async {
    emit(RegisterWithGmailLoading());
    FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((userData) {
        log(userData.toString());
      });
    });
  }

  Future<void> logOutWithFaceBook() async {
    emit(LogoutWithFacebookSuccess());
    FacebookAuth.instance.logOut();
  }

  // loggOut() async {
  //   googleAccount = await _googleSignIn.signOut();
  //   emit(SignOutWithGoogleSuccess());
  // }

  String? validatePhoneNumber(String? value) =>
      validationRepo.validatePhoneNumber(value);

  String? validateEmail(String? value) =>
      validationRepo.validateEmail(value);

  String? validatePassword(String? value) =>
      validationRepo.validatePassword(value);

  String? validateRePassword() => validationRepo.validateRePassword(
        passwordController.text,
        rePasswordController.text,
      );

  bool confirm() {
    if (registerFormKey.currentState!.validate()) {
      return true;
    }
    return false;
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
