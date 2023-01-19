import 'package:clean_architecture/app/moduels/auth/presentation/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../common/themes/app_theme.dart';
import '../../../../../common/widgets/auth_widget.dart';
import '../../../../../common/widgets/default_app_button.dart';
import '../../../../../common/widgets/input_field/default_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthWidget(
          icon: 'assets/icons/open_lock.svg',
          title: 'Reset your password',
          description:
              'At least 8 characters, with uppercase and\n lowercase letters',
          form:const DefaultTextField(
            title: 'New Password',

            hintText: 'enter New password',
            fillColor: Color(0xFFF4F5F7),
            prefixIconPath: 'assets/icons/lock.svg',
            isPasswordField: true,
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children:  const [
          //     DefaultTextField(
          //       title: 'New Password',
          //       hintText: 'enter New password',
          //       fillColor: Color(0xFFF4F5F7),
          //       prefixIconPath: 'assets/icons/lock.svg',
          //       isPasswordField: true,
          //     ),
          //     SizedBox(height: 13),
          //     DefaultTextField(
          //       title: 'Confirm Password',
          //       hintText: 'Repeat password',
          //       fillColor: Color(0xFFF4F5F7),
          //       prefixIconPath: 'assets/icons/lock.svg',
          //       isPasswordField: true,
          //     ),
          //
          //   ],
          // ),
          button: DefaultButton(
            onPress: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
              );
            },
            width: double.infinity,
            //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
            buttonColor: true
                ? AppTheme.lightPrimaryColor
                : Color(0xffFFF3D5),
            title: 'SIGN IN',
            //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
            titleColor: true ? Colors.white : Color(0xFFA8A8A8),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
