import 'package:day1/core/compoents/space.dart';
import 'package:day1/src/app_colors.dart';
import 'package:flutter/material.dart';
import '../../core/utlis/size_config.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.KPrimaryColor,
        title: Align(alignment: Alignment.centerRight, child: Text('About Us')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              VerticalSpace(value: 2),
              Image.asset(
                'assets/images/logo.png',
                width: SizeConfig.screenWidth! * 15,
                height: SizeConfig.defaultSize! * 15,
              ),
              VerticalSpace(value: 2),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'We are portatile Company!',
                      style: TextStyle(
                          color: AppColors.KPrimaryColor,
                          fontSize: 20,
                          fontFamily: 'Rowdies'),
                    ),
                    VerticalSpace(value: 2),
                    Text(
                      'Early computers were meant to be used only for Calculations.'
                      ' \n Simple manual instrument like the abacus have aided people in doing calculations since ancient times.\n '
                      'Early in the industrial Revolution, some mechanical devices were built yo automate long tedious tasks, such as guiding patterns for looms \n'
                      'More sophisticated electrical mechanics did specialized analog calculations in the early 20th century. The first digital electronic calculating machines were developed during World War II \n'
                      'The first semiconductor transistor in he late 1940s were followed by the silicon-based MOSFET (MOS).',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
