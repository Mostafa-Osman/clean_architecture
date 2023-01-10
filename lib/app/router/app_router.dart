part of 'router_imports.dart';

class AppRouter {
  // ignore: body_might_complete_normally_nullable
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
    }
  }
}
