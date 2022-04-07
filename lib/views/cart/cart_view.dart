import 'package:day1/bloc/cart/cart_cubit.dart';
import 'package:day1/core/compoents/space.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/core/utlis/size_config.dart';
import 'package:day1/views/my_orders/components/data.dart';
import 'package:day1/views/my_orders/order_components/order_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/app_colors.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key,}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Cart',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cartcubit = CartCubit.get(context);
              return Column(
                children: [
                  Container(
                    height: SizeConfig.defaultSize! * 60,
                    width: SizeConfig.screenWidth! * 100,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                          itemCount: cartcubit.cart.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 20),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: SizeConfig.defaultSize! * 17,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height:  SizeConfig.defaultSize! * 17,
                                            child:  Image(
                                              image: NetworkImage('https://images.pexels.com/photos/11145305/pexels-photo-11145305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                cartcubit.cart[index].name!,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Price: ' +
                                                    cartcubit
                                                        .cart[index].price
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.red),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        counter++;
                                                      });
                                                    },
                                                    icon: Icon(
                                                        Icons.add_circle_outline,
                                                        size: 30),
                                                  ),
                                                  Text(
                                                    counter.toString(),
                                                    style: TextStyle(
                                                        fontSize: 26),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (counter < 2) {
                                                          counter = 1;
                                                        } else {
                                                          counter--;
                                                        }
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.remove_circle_outline,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: ()
                                    {
                                      cartcubit.removeFromCart(
                                          cartcubit.cart[index]);
                                    },
                                      icon: Icon(
                                        Icons.highlight_remove,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: SizeConfig.defaultSize! * 5,
                    width: SizeConfig.screenWidth! * 0.8,
                    color: Colors.grey[300],
                    child: Center(
                      child: Text('Price : '+cartcubit.getAllPrice().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                    ),
                  ),
                  VerticalSpace(value: 2),
                  Container(
                    width: SizeConfig.screenWidth! * 0.7,
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        cartcubit.getAllPrice().toString();
                        AppNavigator.customNavigator(
                            context: context,
                            screen: OrderView(),
                            finish: false,
                        );
                      },
                      child: Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),),
                        primary: AppColors.KPrimaryColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
