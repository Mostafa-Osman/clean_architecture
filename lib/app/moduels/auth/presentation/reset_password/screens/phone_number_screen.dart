import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/common/widgets/auth_widget.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/reset_password/screens/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../common/themes/app_theme.dart';
import '../../../../../common/widgets/default_app_button.dart';
import '../../../../../common/widgets/input_field/default_text_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthWidget(
            icon: 'assets/icons/open_lock.svg',
            title: 'Password Recovery',
            description: 'Enter your phone number to recover your\npassword',
            form: const DefaultTextField(
              title: 'Phone Number',
              hintText: 'enter your phone Number',
              textInputType: TextInputType.phone,
              maxLength: 11,
              fillColor: Color(0xFFF4F5F7),
              prefixIconPath: 'assets/icons/phone.svg',
              //todo if length of string is 11 'assets/icons/true.svg':null
              suffixIconPath: true ? 'assets/icons/true.svg' : null,
            ),
            button: DefaultButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OtpScreen()),
                );
              },
              width: double.infinity,
              //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
              buttonColor: true ? AppTheme.lightPrimaryColor : Color(0xffFFF3D5),
              title: 'SEND CODE',
              //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
              titleColor: true ? Colors.white : Color(0xFFA8A8A8),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
