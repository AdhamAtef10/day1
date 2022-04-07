import 'package:day1/bloc/cart/cart_cubit.dart';
import 'package:day1/bloc/wish_list/wish_list_cubit.dart';
import 'package:day1/core/compoents/space.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/core/utlis/size_config.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/cart/cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Enums/toast_state.dart';
import '../../bloc/product/product_cubit.dart';
import '../../core/toast/toast.dart';
import '../../models/product/product.dart';

class SingleProductView extends StatefulWidget {
  final Product product;

  SingleProductView({required this.product});

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Text(
                  '${widget.product.name}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                IconButton(onPressed: ()
                {
                  AppNavigator.customNavigator(
                      context: context,
                      screen: CartView(),
                      finish: false,
                  );
                }, icon: Icon(Icons.shopping_cart)),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.defaultSize! * 35,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/11145305/pexels-photo-11145305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  ),
                ),
              ),
              VerticalSpace(value: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocConsumer<WishListCubit, WishListState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var wishcubit = WishListCubit.get(context);
                        return Row(
                          children: [
                            Text(
                              '${widget.product.name.toString()}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.product.isFavorite =
                                  !widget.product.isFavorite;
                                  wishcubit.addToWishList(widget.product);
                                  ToastConfig.showToast(
                                      msg: 'Added To WishList Successfully!',
                                      toastStates: ToastStates.Success);
                                });
                              },
                              icon: Icon(
                                widget.product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    VerticalSpace(value: 1),
                    Text(
                      "Description",
                      style: TextStyle(color: AppColors.KPrimaryColor),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Price  : ' + widget.product.price.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Tax  : ' + widget.product.tax.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Quantity  : ' + widget.product.qty.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Created At  : ' + widget.product.createdAt.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              VerticalSpace(value: SizeConfig.defaultSize! * 0.5),
              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cartCubit = CartCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.all(27.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: AppColors.KPrimaryColor,
                        ),
                        onPressed: () {
                          cartCubit.addToCart(widget.product);
                          ToastConfig.showToast(
                              msg: 'Product Added Successfully!',
                              toastStates: ToastStates.Success);
                        },
                        child: Text('Add To Cart'),
                      ),
                    ),
                  );
                },
              ),
              Center(
                child: Text('Updated At : ' +
                    widget.product.updatedAt.toString(), style: TextStyle(
                    fontSize: 12),),
              ),
            ],
          ),
        );
      },
    );
  }
}
