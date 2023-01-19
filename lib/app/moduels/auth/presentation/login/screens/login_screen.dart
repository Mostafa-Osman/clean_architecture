import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/common/widgets/auth_widget.dart';
import 'package:clean_architecture/app/common/widgets/input_field/default_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        icon: 'assets/images/onBoarding_background.png',
        title: 'Let is Sign You In',
        description: 'Welcome back, you have been missed!',
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: const [
              DefaultTextField(
                  title: 'Phone Number',
                  hintText: 'enter your phone Number',
                  fillColor: Color(0xFFF4F5F7),
                  prefixIconPath: 'assets/icons/phone.svg'),
              DefaultTextField(
                  title: 'Password',
                  hintText: 'enter your password',
                  fillColor: Color(0xFFF4F5F7),
                  prefixIconPath: 'assets/icons/lock.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
