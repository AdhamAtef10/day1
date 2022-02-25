import 'dart:async';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/views/onboarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utlis/size_config.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), ()=>AppNavigator.customNavigator(
        context: context, screen: const OnBoardingScreen(), finish: false)
    );
  }
  @override
  Widget build(BuildContext context)
  {
    SizeConfig.init(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child:Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.scaleDown,
              )
          ),
        ),
      ),
    );
  }
}
