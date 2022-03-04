import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/views/login/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingModel
{
   final String? image;
   final String? title;

  OnBoardingModel({this.title, this.image});
}
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin{
  final int _numDots = 3;
  late final TabController _controller;
  bool isLast=false;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _numDots, vsync: this);
  }

  List<OnBoardingModel> boarding=[
    OnBoardingModel(
      image:'assets/images/onboarding1.png',
      title: 'Browse the menu\n and order directly from\n the application',
    ),
    OnBoardingModel(
      image:'assets/images/onboarding2.png',
      title: 'Your order will be \n immediately collected and\n send by our courier',
    ),
    OnBoardingModel(
      image:'assets/images/onboarding3.png',
      title: 'Pick up delivery]\n at your door and enjoy\n groceries',
    ),
    OnBoardingModel(
      image:'assets/images/onboarding3.png',
      title: 'Pick up delivery]\n at your door and enjoy\n groceries',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: ()
              {
                AppNavigator.customNavigator(context: context, screen: LoginView(), finish: false);
              },
              child: Text('Skip'),
          )
        ],
      ),
     body: Padding(
       padding: const EdgeInsets.all(30),
       child: Column(
         children: [
           Expanded(
             child: PageView.builder(
                 itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
               itemCount: boarding.length,
               onPageChanged: (int index)
               {
                 if(index==boarding.length-1)
                   {
                     setState(() {
                       isLast=true;
                     });
                     print('last');
                     /*TextButton(
                       onPressed: ()
                       {
                         AppNavigator.customNavigator(context: context, screen: LoginView(), finish: false);
                       },
                       child: Text('Get Started',
                       style: TextStyle(color: Colors.black),),
                     );*/
                     AppNavigator.customNavigator(context: context, screen: const LoginView(), finish: false);
                   }
                 else
                   {
                     print('not last');
                     setState(() {
                       isLast=false;
                     });
                   }
               },
             ),
           ),
           const SizedBox(
             height: 30,
           ),
         ],
       ),
     ),
    );
  }

  Widget buildBoardingItem(OnBoardingModel model)=>Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),),
      ),
      Text('${model.title}',
        style: const TextStyle(fontSize: 25),),
      TabPageSelector(
          controller: _controller,

      ),
    ],
  );
}

