import 'package:clean_architecture/app/common/widgets/input_field/default_text_field.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/themes/app_theme.dart';
import '../../../../../common/widgets/default_app_button.dart';
import '../../../../../common/widgets/register_with_social.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDAD0e1),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: const [
                  SizedBox(height: 50.0),
                  Text(
                    'Login ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.lightPrimaryColor),
                  ),
                  SizedBox(height: 80.0),
                  DefaultTextField(
                      title: 'Email or phone number',
                      hintText: 'enter your email',
                      fillColor: Color(0xFFCD77F2),
                      prefixIconPath: 'assets/icons/call.svg'),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultTextField(
                    title: 'password',
                    // controller: registerCubit.rePasswordController,
                    prefixIconPath: 'assets/icons/lock.svg',
                    fillColor: Color(0xFFCD77F2),
                    // validator: (_) => registerCubit.validateRePassword(),
                    isPasswordField: true,
                  ),
                  SizedBox(height: 50.0),
                  DefaultAppButton(
                    title: 'submit',
                    // onPress: registerCubit.confirm,
                  ),
                  SizedBox(height: 50.0),
                  RegisterWithSocial(
                    isLogin: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
