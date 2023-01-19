import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final boardingController = PageController();
  int currentIndex = 0;
  List<OnBoardingModel> contents = [
    OnBoardingModel(
      title:  'Your Passion for giving is\n\t\t\t\t\t\t\t\t\t\tCommendable.',
      image: 'assets/icons/logo.png',
    ),

    OnBoardingModel(
      title:  'Don\'t wait. This time is to\n\t\t\t\t\t\tGive.',
      image: 'assets/icons/logo.png',
    ),
    OnBoardingModel(
      title:  'You have the Power to\n\t\t\t\t\t\tBring Page3.',
      image: 'assets/icons/logo.png',
    ),
  ];
  void onPageChanged(int index) {
    currentIndex = index;
    boardingController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    emit(OnBoardingChangeIndex());
  }
}
