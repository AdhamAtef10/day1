import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingView();
}

class _OnBoardingView extends State<OnBoardingView>
    with SingleTickerProviderStateMixin {
  final int _numDots = 3;
  late final TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _numDots, vsync: this);
  }

  void _moveNext() {
    setState(() {
      (_controller.index == _numDots - 1)
          ? _controller.index = 0
          : _controller.index++;
    });
  }

  List<Image> widgets = [
    Image(image: AssetImage('assets/images/onboarding1.png')),
    Image(image: AssetImage('assets/images/onboarding2.png')),
    Image(image: AssetImage('assets/images/onboarding3.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgets[_controller.index],
          TabPageSelector(controller: _controller),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: _moveNext,
                  child: Text("Next")
              )
          )
        ],
      ),
    );

  }
}
