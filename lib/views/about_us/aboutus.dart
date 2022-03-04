
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
       iconTheme: IconThemeData(color: Colors.black),
       elevation: 0,
       actions: [
         Text('About Us',
         style: TextStyle(
           fontSize: 27,
           color: Colors.black,
           fontWeight: FontWeight.bold,
         ),)
       ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 40,
                child: Container(
                  width: 390,
                  height: 250,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 390,
              height: double.infinity,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
