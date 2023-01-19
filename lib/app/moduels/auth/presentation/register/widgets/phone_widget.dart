import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/default_app_button.dart';
import '../../../../../common/widgets/input_field/default_text_field.dart';
import '../../../../../common/widgets/shimmer/shimmer_button.dart';
import '../cubit/register_cubit.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [
                DefaultTextField(
                  title: 'Phone',
                  controller: registerCubit.phoneController,
                  textInputType: TextInputType.phone,
                  maxLength: 11,
                  prefixIconPath: 'assets/icons/call.svg',
                  fillColor: const Color(0xFFCD77F2),
                  validator: registerCubit.validatePhoneNumber,
                ),
                (state is RegisterLoading)
                    ? const ShimmerButton()
                    : DefaultButton(
                  title: 'submit',
                  onPress: registerCubit.registerWithForm,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
