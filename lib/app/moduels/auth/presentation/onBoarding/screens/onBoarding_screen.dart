import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/onBoarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/data/local/routing_pref.dart';
import '../../../../../common/themes/app_theme.dart';
import '../../../../../common/widgets/default_app_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    RoutingPrefs.setOnBoardingSeen();
  }
  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = context.read<OnBoardingCubit>();

    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/onBoarding_background.png'),
              fit: BoxFit.cover),
        ),
        child: SizedBox(
          child: PageView.builder(
            controller: onBoardingCubit.boardingController,
            itemCount: onBoardingCubit.contents.length,
            onPageChanged: onBoardingCubit.onPageChanged,
            itemBuilder: (_, index) {
              final currentPage = onBoardingCubit.contents[index];
              return Column(
                children: [
                  Container(
                    height: context.height * .33,
                    width: context.width * .8,
                    margin:
                        EdgeInsets.symmetric(vertical: context.height * .13),
                    padding: const EdgeInsets.only(top: 25.0, left: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      currentPage.image,
                    ),
                  ),
                  Text(
                    currentPage.title,
                    style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DMSans',
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  OnBoardingPageIndicator(index: index),
                  const SizedBox(
                    height: 150.0,
                  ),
                  const DefaultButton(
                    title: 'GET STARTED',
                      fontFamily:'DMSans-Medium.ttf'

                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OnBoardingPageIndicator extends StatelessWidget {
  final int index;

  const OnBoardingPageIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = context.read<OnBoardingCubit>();
    return Center(
      child: SmoothPageIndicator(
        controller: onBoardingCubit.boardingController,
        count: 3,
        onDotClicked: onBoardingCubit.onPageChanged,
        effect: const JumpingDotEffect(
          activeDotColor: AppTheme.disabledTextColor,
          dotColor: Colors.white,
          dotHeight: 5,
          dotWidth: 10,
          spacing: 8,
          jumpScale: 3,
        ),
      ),
    );
  }
}
