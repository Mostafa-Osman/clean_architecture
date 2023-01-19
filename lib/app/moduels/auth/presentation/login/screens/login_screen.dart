import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/common/themes/app_theme.dart';
import 'package:clean_architecture/app/common/widgets/auth_widget.dart';
import 'package:clean_architecture/app/common/widgets/default_app_button.dart';
import 'package:clean_architecture/app/common/widgets/input_field/default_text_field.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/screens/register.dart';
import 'package:flutter/material.dart';

import '../../register/screens/register_screen.dart';
import '../../reset_password/screens/phone_number_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthWidget(
          icon: 'assets/icons/person.svg',
          title: 'Let is Sign You In',
          description: 'Welcome back, you have been missed!',
          form: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const DefaultTextField(
                title: 'Phone Number',
                hintText: 'enter your phone Number',
                textInputType: TextInputType.phone,
                maxLength: 11,
                fillColor: Color(0xFFF4F5F7),
                prefixIconPath: 'assets/icons/phone.svg',
                //todo if length of string is 11 'assets/icons/true.svg':null
                suffixIconPath: true ? 'assets/icons/true.svg' : null,
              ),
              const SizedBox(height: 13),
              const DefaultTextField(
                title: 'Password',
                hintText: 'enter your password',
                fillColor: Color(0xFFF4F5F7),
                prefixIconPath: 'assets/icons/lock.svg',
                isPasswordField: true,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PhoneNumberScreen()),
                  );
                },
                child: const Text(
                  'forgot password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontFamily: 'DMSans',
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const DefaultButton(
                width: double.infinity,
                //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
                buttonColor:
                    true ? AppTheme.lightPrimaryColor : Color(0xffFFF3D5),
                title: 'Sign IN',
                //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
                titleColor: true ? Colors.white : Color(0xFFA8A8A8),
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8),
              DefaultButton(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                width: double.infinity,
                buttonColor: const Color(0xffF4F5F7),
                title: 'Create an account',
                titleColor: const Color(0xff172B4D),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
