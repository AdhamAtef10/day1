import 'package:day1/bloc/categories/categories_cubit.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/models/categories/categories.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/categories/single_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
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
                    'All Categories',
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
                      cubit.categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: SingleCategoryView(
                                  id: cubit.categories[index].id,
                                name: cubit.categories[index].name,
                              ),
                              finish: false);
                        },
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
                                        cubit.categories[index].image!),
                                    width: double.infinity,
                                  ),
                                  Text(
                                    cubit.categories[index].name!,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
