import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../moduels/auth/presentation/login/cubit/login_cubit.dart';

class RegisterWithSocial extends StatelessWidget {
  final bool isLogin;

  const RegisterWithSocial({Key? key, this.isLogin = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    final loginCubit = context.read<LoginCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => isLogin ? null : registerCubit.registerWithGmail(),
          child: Container(
            height: 50.0,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/google.svg',
                color: Colors.white,
                width: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: isLogin ? null : registerCubit.registerWithFaceBook,
          child: Container(
            height: 50.0,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(66, 103, 178, 1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/icons/facebook.svg',
                color: Colors.white,
                width: 45,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        if (isLogin)
          InkWell(
            onTap: () async {
               bool isAuthenticated = await loginCubit.authenticate();
              if (isAuthenticated) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const RegisterScreen()),
                // );
              } else {
                Container();
              }
            },
            child: Container(
              height: 70.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/icons/fingerPrint.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
