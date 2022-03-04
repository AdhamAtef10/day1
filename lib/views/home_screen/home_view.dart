import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:day1/bloc/categories/categories_cubit.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/home_screen/components/drawer.dart';
import 'package:day1/views/home_screen/components/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utlis/size_config.dart';

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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 27,
                        color: AppColors.KPrimaryColor,
                      ),
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
                          fallback: (context)=> Text('يا عم لسه بنحمل الداتا') ,
                          builder:  (context)=>Container(
                            height: SizeConfig.screenHeight! * 0.20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.categories.length,
                                itemBuilder: (context, index) {
                                  return  Container(
                                    color: Colors.grey,
                                    child: Column(
                                      children: [
                                        Image.network(cubit.categories[index].image!,
                                          width: SizeConfig.screenWidth!*0.2,
                                          height: SizeConfig.screenHeight!*0.12,),
                                        Text(cubit.categories[index].name.toString()),
                                      ],
                                    ),
                                  );
                                }),
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
