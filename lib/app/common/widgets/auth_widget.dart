import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Widget body;

  const AuthWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(icon), fit: BoxFit.cover),
      ),
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
                    color: Colors.black,
                    fontFamily: 'DMSans',
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color(0xffC1C7D0),
                    fontFamily: 'DMSans',
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                body
              ],
            ),
          ),
          Positioned(
              top: 135,
              right: 145,
              left: 145,
              child: SvgPicture.asset('assets/icons/person.svg')),
        ],
      ),
    );
  }
}
