import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterWithForm extends StatelessWidget {
  const RegisterWithForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => registerCubit.registerWithGmail(),
          child: Container(
            height: 50.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/google.svg',
                color: Colors.red,
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
          onTap: registerCubit.registerWithFaceBook,
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
      ],
    );
  }
}
