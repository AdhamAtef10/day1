import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliderr extends StatelessWidget {
  final List<String>Images = [
    'assets/images/logo.png',
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: Images.map(
                (e) => ClipRRect(
              child: Stack(
                fit: StackFit.expand,
                children:<Widget> [
                  Image.asset(e,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: false,
            height: 150,
            initialPage: 0,
            reverse: false,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
