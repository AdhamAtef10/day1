
import 'package:day1/Enums/order_states.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/my_orders/components/data.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {

  final Order user ;
  OrderItem(this.user);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children:
        [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children: [
                  Text(
                    '${user.orderState.name}',
                    style: TextStyle(
                      color:  user.orderState==OrderState.canceled? Colors.red:Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    '${user.price}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.KPrimaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.lock_clock),
                  Text(
                    '${user.date}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                '${user.address}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}