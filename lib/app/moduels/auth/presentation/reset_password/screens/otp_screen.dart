import 'package:clean_architecture/app/moduels/auth/presentation/reset_password/screens/reser_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/themes/app_theme.dart';
import '../../../../../common/widgets/auth_widget.dart';
import '../../../../../common/widgets/default_app_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthWidget(
          icon: 'assets/icons/open_lock.svg',
          title: 'Verify your identity',
          //todo should add user phone
          description: 'We have just sent a code to (02)01128582414',
          form: Expanded(
            child: Column(
              children: [
                const SizedBox(height: 30),
                PinCodeTextField(
                  length: 6,
                  autoFocus: true,
                  cursorColor: AppTheme.lightPrimaryColor,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textStyle: const TextStyle(
                    color: Color(0xff172B4D),
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 2,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: AppTheme.fillColor,
                    activeColor: AppTheme.lightPrimaryColor,
                    inactiveColor: Colors.grey.shade300,
                    inactiveFillColor: AppTheme.fillColor,
                    selectedColor: AppTheme.lightPrimaryColor,
                    selectedFillColor: AppTheme.fillColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  // onCompleted: verificationCubit.saveOtpCode,
                  // onChanged: verificationCubit.saveOtpCode,
                  beforeTextPaste: (_) => true,
                  appContext: context,
                  onChanged: (String value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I didn\'t receive code.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppTheme.disabledTextColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Resend Code.',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppTheme.lightPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'DMSans',
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        button:   DefaultButton(
            onPress: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
      );
      },
        width: double.infinity,
        //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
        buttonColor:
        true ? AppTheme.lightPrimaryColor : Color(0xffFFF3D5),
        title: 'Next',
        //todo if field in phone and pass is empty  Color(0xFFA8A8A8):AppTheme.lightPrimaryColor
        titleColor: true ? Colors.white : Color(0xFFA8A8A8),
        fontWeight: FontWeight.w700,
      ),

        ),
      ),
    );
  }
}
