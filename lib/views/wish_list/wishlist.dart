import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../core/utlis/size_config.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Align(
            alignment: Alignment.centerRight,
          child: Text(
            'Wishlist',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black),
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
                  ],
                );
              })
        ],
      ),
    );
  }
}
