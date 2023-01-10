import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoApp extends StatelessWidget {
  const MoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit()),
      ],
      child: GestureDetector(
        onTap: () => context.requestFocus(FocusNode()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const RegisterScreen(),
        ),
      ),
    );
  }
}
