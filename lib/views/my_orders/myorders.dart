import 'package:day1/Enums/order_states.dart';
import 'package:day1/views/my_orders/components/data.dart';
import 'package:day1/views/my_orders/components/item.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {

  List<Order> users = [
    Order(
      orderState: OrderState.canceled,
      price:' 2400 EGP',
      date: '17 Nov 2022',
      address: '140 Giza Bahr_Azzam street',

    ),
    Order(
      orderState: OrderState.canceled,
      price:' 2400 EGP',
      date: '17 Nov 2022',
      address: '140 Giza Bahr_Azzam street',

    ),
    Order(
      orderState: OrderState.canceled,
      price:' 2400 EGP',
      date: '17 Nov 2022',
      address: '140 Giza Bahr_Azzam street',

    ),
    Order(
      orderState: OrderState.canceled,
      price:' 2400 EGP',
      date: '17 Nov 2022',
      address: '140 Giza Bahr_Azzam street',

    ),
    Order(
      orderState: OrderState.canceled,
      price:' 2400 EGP',
      date: '17 Nov 2022',
      address: '140 Giza Bahr_Azzam street',

    ),
    Order(
      orderState: OrderState.canceled,
      price:' 2400 EGP',
      date: '17 Nov 2022',
      address: '140 Giza Bahr_Azzam street',

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Text('My Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30
          ),),
        ],
      ),
      body: ListView.separated(
        itemBuilder:(context,index)=>OrderItem(users[index]),
        separatorBuilder:(context,index)=> Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ) ,
        itemCount:users.length,
      ),
    );
  }
}