import 'package:day1/bloc/categories/categories_cubit.dart';
import 'package:day1/bloc/product/product_cubit.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/models/categories/categories.dart';
import 'package:day1/models/product/prodcut_to_category.dart';
import 'package:day1/models/product/product.dart';
import 'package:day1/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCategoryView extends StatefulWidget {
  final id;

  final name;

  SingleCategoryView({required this.id, this.name});

  @override
  State<SingleCategoryView> createState() => _SingleCategoryViewState();
}

class _SingleCategoryViewState extends State<SingleCategoryView> {
  @override
  void initState() {
    ProductCubit.get(context).getProductsByCategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black, size: 30),
            elevation: 0,
            actions: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${widget.name}',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.KPrimaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.all(20),
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    children: List.generate(
                      cubit.products.length,
                      (index) => GestureDetector(
                        onTap: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: Prodcut_to_category(),
                              finish: false);
                        },
                        child: SingleChildScrollView(
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.grey[300],
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          'https://images.pexels.com/photos/11145305/pexels-photo-11145305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                      width: double.infinity,
                                    ),
                                    Text(
                                      cubit.products[index].name!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
