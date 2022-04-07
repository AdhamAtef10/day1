import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/home_screen/home_view.dart';
import 'package:day1/views/my_orders/components/data.dart';
import 'package:day1/views/my_orders/components/item.dart';
import 'package:day1/views/my_orders/order_components/order_desgin.dart';
import 'package:flutter/material.dart';

import '../../../Enums/order_states.dart';

class OrderView extends StatelessWidget {
  List<Order> order = [
    Order(
      orderState: OrderState.OrderReceived,
      price: ' 3500 EGP',
      date: '10 Nov 2022',
      address: '140 Giza Bahr_Azzam street',
    ),
    Order(
      orderState: OrderState.OnTheWay,
      price: ' 2560 EGP',
      date: '20 Nov 2022',
      address: '140 Giza Bahr_Azzam street',
    ),
    Order(
      orderState: OrderState.OnTheWay,
      price: ' 1400 EGP',
      date: '22 Nov 2022',
      address: '140 Giza Bahr_Azzam street',
    ),
    Order(
      orderState: OrderState.Canceled,
      price: ' 6400 EGP',
      date: '23 Nov 2022',
      address: 'Zamalek',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Order Detalis',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: order.length,
        itemBuilder: (context, index) => OrderDesgin(order[index]),
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AppNavigator.customNavigator(
            context: context,
            screen: HomeView(),
            finish: false,
          );
        },
        label: Text(
          'Back To Store',
        ),
        backgroundColor: AppColors.KPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
