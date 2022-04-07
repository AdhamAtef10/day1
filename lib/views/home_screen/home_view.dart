import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:day1/bloc/categories/categories_cubit.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/home_screen/components/drawer.dart';
import 'package:day1/views/home_screen/components/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utlis/size_config.dart';
import '../categories/all_categories.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  void initState() {
    CategoriesCubit.get(context).getAllCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      drawer: Drawerr(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          width: SizeConfig.defaultSize! * 33,
          height: SizeConfig.defaultSize! * 5,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Sliderr(),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 27,
                          color: AppColors.KPrimaryColor,
                        ),
                      ),
                      onPressed: () {
                        AppNavigator.customNavigator(
                            context: context,
                            screen: CategoriesScreen(),
                            finish: false);
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.03,
                  ),
                  BlocConsumer<CategoriesCubit, CategoriesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = CategoriesCubit.get(context);
                        return ConditionalBuilder(
                          condition:cubit.categories.isNotEmpty ,
                          fallback: (context)=> Text('Loading') ,
                          builder:  (context)=>Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.categories.length,
                                  itemBuilder: (context, index) {
                                    return  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Colors.grey[200],
                                        child: Column(
                                          children: [
                                            Image.network(cubit.categories[index].image!,
                                              width: 155,
                                              height: 80,
                                            ),
                                            Text(cubit.categories[index].name.toString()),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                        'Best Seller',
                      style: TextStyle(
                        fontSize: 27,
                        color: AppColors.KPrimaryColor,
                      ),
                    ),
                  ),
                  BlocConsumer<CategoriesCubit, CategoriesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = CategoriesCubit.get(context);
                        return ConditionalBuilder(
                          condition:cubit.categories.isNotEmpty ,
                          fallback: (context)=> Text('Loading') ,
                          builder:  (context)=>Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cubit.categories.length,
                                    itemBuilder: (context, index) {
                                      return  Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Image.network(cubit.categories[index].image!,
                                              width: 155,
                                              height: 80,),
                                            Text(cubit.categories[index].name.toString()),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: AppColors.KPrimaryColor,
                                              ),
                                                onPressed: () {},
                                                child: Text('Add To Cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'All Item',
                      style: TextStyle(
                        fontSize: 27,
                        color: AppColors.KPrimaryColor,
                      ),
                    ),
                  ),
                  BlocConsumer<CategoriesCubit, CategoriesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var cubit = CategoriesCubit.get(context);
                        return ConditionalBuilder(
                          condition:cubit.categories.isNotEmpty ,
                          fallback: (context)=> Text('Loading') ,
                          builder:  (context)=>Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.categories.length,
                                  itemBuilder: (context, index) {
                                    return  Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Image.network(cubit.categories[index].image!,
                                            width: 155,
                                            height: 80,),
                                          Text(cubit.categories[index].name.toString()),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
