import 'package:clean_architecture/app/moduels/payment/presentation/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentCubit=context.read<PaymentCubit>;
    return Scaffold(

    );
  }
}
