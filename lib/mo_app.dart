import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/login/cubit/login_cubit.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/login/screens/login.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/screens/register.dart';
import 'package:clean_architecture/app/moduels/onBoarding/screens/onBoarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/moduels/auth/presentation/login/screens/login_screen.dart';
import 'app/moduels/auth/presentation/reset_password/screens/otp_screen.dart';
import 'app/moduels/auth/presentation/reset_password/screens/phone_number_screen.dart';
import 'app/moduels/auth/presentation/reset_password/screens/reser_password_screen.dart';
import 'app/moduels/onBoarding/cubit/on_boarding_cubit.dart';

class MoApp extends StatelessWidget {
  const MoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        //todo remove it
        BlocProvider(create: (_) => OnBoardingCubit()),

      ],
      child: GestureDetector(
        onTap: () => context.requestFocus(FocusNode()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const OnBoardingScreen(),
        ),
      ),
    );
  }
}
