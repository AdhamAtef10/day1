import 'package:day1/Enums/toast_state.dart';
import 'package:day1/core/compoents/custom_text_field.dart';
import 'package:day1/core/compoents/space.dart';
import 'package:day1/core/toast/toast.dart';
import 'package:day1/src/app_colors.dart';
import 'package:flutter/material.dart';

class ContentUs extends StatelessWidget {
  const ContentUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Contnet us',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.phone,),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('+012 347 898 587 \nMobile'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Icon(Icons.mail_outline,),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('AdhamAtef@mail.com \nMail'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Icon(Icons.message,),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('+012 345 678 910 \nPortail Message'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text('Send Message',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.KPrimaryColor,
              ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Message',
                    enabledBorder: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 150)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.KPrimaryColor,
                  ),
                    onPressed: ()
                    {
                      ToastConfig.showToast(
                          msg: 'Massage Sent Successfully!',
                          toastStates: ToastStates.Success,
                      );
                    },
                    child: Text('Send Massage',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
