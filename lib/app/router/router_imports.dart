import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/screens/register.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/register/widgets/phone_widget.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/reset_password/screens/reser_password_screen.dart';
import 'package:clean_architecture/app/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../moduels/auth/presentation/login/cubit/login_cubit.dart';
import '../moduels/auth/presentation/login/screens/login.dart';
import '../moduels/auth/presentation/login/screens/login_screen.dart';
import '../moduels/auth/presentation/reset_password/screens/otp_screen.dart';
import '../moduels/auth/presentation/reset_password/screens/phone_number_screen.dart';
import '../moduels/home/presentation/cubit/home_cubit.dart';
import '../moduels/home/presentation/screens/home_screen.dart';
import '../moduels/onBoarding/screens/onBoarding_screen.dart';

part 'app_router.dart';
