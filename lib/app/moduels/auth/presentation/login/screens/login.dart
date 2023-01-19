// import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
// import 'package:clean_architecture/app/common/widgets/input_field/default_text_field.dart';
// import 'package:clean_architecture/app/moduels/auth/presentation/login/cubit/login_cubit.dart';
// import 'package:clean_architecture/app/moduels/auth/presentation/register/cubit/register_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../common/themes/app_theme.dart';
// import '../../../../../common/widgets/default_app_button.dart';
// import '../../../../../common/widgets/register_with_social.dart';
// import '../../../../../common/widgets/toast.dart';
// import '../../../../../router/router_name.dart';
// import '../../register/screens/register_screen.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocConsumer<LoginCubit, LoginState>(
//
//         listener: (context,state){
//           if(state is RegisterError)
//             {
//               // showToast(message: state., state: ToastStates.error);
//
//             }
//         },
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 50.0),
//                   const Text(
//                     'Login ',
//                     style: TextStyle(
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.w600,
//                         color: AppTheme.lightPrimaryColor),
//                   ),
//                   const SizedBox(height: 80.0),
//                   const DefaultTextField(
//                       title: 'Email or phone number',
//                       hintText: 'enter your email',
//                       fillColor: Color(0xFFCD77F2),
//                       prefixIconPath: 'assets/icons/call.svg'),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   const DefaultTextField(
//                     title: 'password',
//                     // controller: registerCubit.rePasswordController,
//                     prefixIconPath: 'assets/icons/lock.svg',
//                     fillColor: Color(0xFFCD77F2),
//                     // validator: (_) => registerCubit.validateRePassword(),
//                     isPasswordField: true,
//                   ),
//                   const SizedBox(height: 50.0),
//                   const DefaultButton(
//                     title: 'submit',
//                     // onPress: registerCubit.confirm,
//                   ),
//                   const SizedBox(height: 30.0),
//                   const RegisterWithSocial(
//                     isLogin: true,
//                   ),
//                   const SizedBox(height: 10.0),
//                   TextButton(
//                       onPressed: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const RegisterScreen()),
//                           ),
//                       child: const Text('Don\'t have an account?'))
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
