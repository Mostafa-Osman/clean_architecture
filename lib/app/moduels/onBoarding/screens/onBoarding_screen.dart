import 'package:clean_architecture/app/common/extensions/context_extensions.dart';
import 'package:clean_architecture/app/moduels/auth/presentation/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/data/local/routing_pref.dart';
import '../../../common/themes/app_theme.dart';
import '../../../common/widgets/default_app_button.dart';
import '../cubit/on_boarding_cubit.dart';

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
      body: Stack(
        children: [
          Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/onBoarding_background.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: context.height * .33,
                  width: context.width * .8,
                  margin: EdgeInsets.symmetric(vertical: context.height * .13),
                  padding: const EdgeInsets.only(top: 25.0, left: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/logo.png',
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DefaultButton(
                        onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            ),
                        title: 'GET STARTED',
                        fontFamily: 'DMSans-Medium.ttf'),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.height*.9,
            width: context.width,
            child: PageView.builder(
              controller: onBoardingCubit.boardingController,
              itemCount: onBoardingCubit.titles.length,
              onPageChanged: onBoardingCubit.onPageChanged,
              itemBuilder: (_, index) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: context.height * 0.23),
                    child: Text(
                      onBoardingCubit.titles[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans',
                          color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          const OnBoardingPageIndicator(),
        ],
      ),
    );
  }
}

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = context.read<OnBoardingCubit>();
    return Positioned(
      bottom: context.height * 0.28,
      left: context.width / 2.2,
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
