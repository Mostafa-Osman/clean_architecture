import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../auth/data/model/on_boarding_model.dart';


part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final boardingController = PageController();
  int currentIndex = 0;
  List<String> titles = [
     'Your Passion for giving is\nCommendable.',

       'Don\'t wait. This time is to\nGive.',
        'You have the Power to\nBring Page3.',
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
