part of 'router_imports.dart';

class AppRouter {
  // ignore: body_might_complete_normally_nullable
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const OnBoardingScreen(),
          ),
        );
      // case RouteNames.register:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => RegisterCubit(),
      //       child: const RegisterScreen(),
      //     ),
      //   );
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case RouteNames.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const PhoneNumberScreen(),
          ),
        );
      case RouteNames.resetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const ResetPasswordScreen(),
          ),
        );
      case RouteNames.otp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const OtpScreen(),
          ),
        );
      case RouteNames.phoneNumber:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RegisterCubit(),
            child: const PhoneScreen(),
          ),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
    }
  }
}
