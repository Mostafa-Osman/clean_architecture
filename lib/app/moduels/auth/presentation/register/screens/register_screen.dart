import 'package:clean_architecture/app/common/themes/app_theme.dart';
import 'package:clean_architecture/app/common/widgets/input_field/default_text_field.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
import 'package:clean_architecture/app/common/widgets/register_with_social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/default_app_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Scaffold(
      backgroundColor: const Color(0xFFDAD0e1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              const Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.lightPrimaryColor),
              ),
              const SizedBox(height: 40.0),
              Form(
                  key: registerCubit.registerFormKey,
                  child: Column(
                    children: [
                      DefaultTextField(
                          title: 'Name',
                          controller: registerCubit.fullNameController,
                          prefixIconPath: 'assets/icons/profile.svg',
                          fillColor: const Color(0xFFCD77F2)),
                      const SizedBox(height: 10.0),
                      DefaultTextField(
                        title: 'Phone',
                        controller: registerCubit.phoneController,
                        textInputType: TextInputType.phone,
                        maxLength: 11,
                        prefixIconPath: 'assets/icons/call.svg',
                        fillColor: const Color(0xFFCD77F2),
                        validator: registerCubit.validatePhoneNumber,
                      ),
                      const SizedBox(height: 10.0),
                      DefaultTextField(
                        title: 'Email',
                        controller: registerCubit.emailController,
                        textInputType: TextInputType.emailAddress,
                        prefixIconPath: 'assets/icons/email.svg',
                        fillColor: const Color(0xFFCD77F2),
                        validator: registerCubit.validateEmail,
                      ),
                      const SizedBox(height: 10.0),
                      DefaultTextField(
                        title: 'password',
                        controller: registerCubit.passwordController,
                        prefixIconPath: 'assets/icons/lock.svg',
                        isPasswordField: true,
                        fillColor: const Color(0xFFCD77F2),
                        validator: registerCubit.validatePassword,
                      ),
                      const SizedBox(height: 10.0),
                      DefaultTextField(
                        title: 'Re-write-password',
                        controller: registerCubit.rePasswordController,
                        prefixIconPath: 'assets/icons/lock.svg',
                        fillColor: const Color(0xFFCD77F2),
                        validator: (_) => registerCubit.validateRePassword(),
                        isPasswordField: true,
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  )),
              const RegisterWithSocial(),
              const SizedBox(height: 50.0),
              DefaultAppButton(
                title: 'submit',
                onPress: registerCubit.confirm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
