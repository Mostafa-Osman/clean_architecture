import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../moduels/auth/presentation/reset_password/screens/otp_screen.dart';
import '../themes/app_theme.dart';
import 'default_app_button.dart';

class AuthWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Widget form;
  final Widget? button;

  const AuthWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      required this.form,
      this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/onBoarding_background.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              //todo
              child: Stack(
                children: [
                  Container(
                    height: context.height,
                    width: context.width,
                    margin: const EdgeInsets.only(top: 180),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 80.0,
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff172B4D),
                              fontFamily: 'DMSans',
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffC1C7D0),
                              fontFamily: 'DMSans',
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Expanded(child: form)
                        ],
                      ),
                    ),
                  ),
                  //icon
                  Positioned(
                      top: 135,
                      right: 145,
                      left: 145,
                      child: SvgPicture.asset(icon)),
                ],
              ),
            ),
          ),
          if(button!=null)
          Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 45, left: 35, right: 35),
              child: button!),
        ],
      ),
    );
  }
}
