import 'package:day1/core/compoents/custom_text_field.dart';
import 'package:day1/core/compoents/space.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/home_screen/home_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'profile',
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalSpace(value: 2),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Adham Atef',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hint: 'Address',
                    prefix: Icons.home_rounded,
                    sufixicon: null,
                    obscure: false,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  hint: 'Phone',
                  prefix: Icons.phone,
                  sufixicon: null,
                  obscure: false,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  hint: 'Password',
                  prefix: Icons.lock,
                  sufixicon: null,
                  obscure: true,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.KPrimaryColor,
                  ),
                    onPressed: () {
                      AppNavigator.customNavigator(
                          context: context,
                          screen: HomeView(),
                          finish: false,
                      );
                    },
                    child: Text('Confirm',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
