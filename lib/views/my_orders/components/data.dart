import 'package:flutter/cupertino.dart';

import '../../../Enums/order_states.dart';

class Order {
  OrderState orderState;
  String date;
  String address;
  String price;


  Order({
    required this.orderState,
    required this.date,
    required this.address,
    required this.price,
  });
}