import 'package:flutter/material.dart';

import '../../../../../common/themes/app_theme.dart';
import '../../../../../common/widgets/auth_widget.dart';
import '../../../../../common/widgets/default_app_button.dart';
import '../../../../../common/widgets/input_field/default_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthWidget(
          icon: 'assets/icons/person.svg',
          title: 'Getting Started',
          description: 'Create an account to continue!',
          form: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              const DefaultTextField(
                title: 'Full Name',
                hintText: 'enter your Name',
                fillColor: Color(0xFFF4F5F7),
                prefixIconPath: 'assets/icons/user.svg',
                //todo if field is not empty 'assets/icons/true.svg':null
                suffixIconPath: true ? 'assets/icons/true.svg' : null,
              ),
              const  SizedBox(height: 12),
              const  DefaultTextField(
                title: 'Phone Number',
                hintText: 'enter your phone Number',
                textInputType: TextInputType.phone,
                maxLength: 11,
                fillColor: Color(0xFFF4F5F7),
                prefixIconPath: 'assets/icons/phone.svg',
                //todo if length of string is 11 'assets/icons/true.svg':null
                suffixIconPath: true ? 'assets/icons/true.svg' : null,
              ),
              const  SizedBox(height: 12),
              const  DefaultTextField(
                title: 'Password',
                hintText: 'enter password',
                fillColor: Color(0xFFF4F5F7),
                prefixIconPath: 'assets/icons/lock.svg',
                isPasswordField: true,
              ),
              const  SizedBox(height: 12),
              const DefaultTextField(
                title: 'Repeat Password',
                hintText: 'Repeat password',
                fillColor: Color(0xFFF4F5F7),
                prefixIconPath: 'assets/icons/lock.svg',
                isPasswordField: true,
              ),
              const   SizedBox(height: 12),
              const  DefaultButton(
                width: double.infinity,
                //todo if all field  is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
                buttonColor:
                    true ? AppTheme.lightPrimaryColor : Color(0xffFFF3D5),
                title: 'SIGN UP',
                //todo if all field is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
                titleColor: true ? Colors.white : Color(0xFFA8A8A8),
                fontWeight: FontWeight.w700,
              ),
              const  SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign in',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppTheme.lightPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
