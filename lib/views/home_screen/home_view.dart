import 'package:day1/bloc/categories/categories_cubit.dart';
import 'package:day1/src/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utlis/size_config.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        )
        ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            //slider
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                 Text('Categories',
                  style: TextStyle(
                    fontSize: 27,
                    color: AppColors.KPrimaryColor,
                  ),),
                BlocConsumer<CategoriesCubit,CategoriesState>(
                    listener:(context,state){} ,
                    builder: (context,state){
                      var cubit= CategoriesCubit.get(context);
                      return Container(
                        height:150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount:cubit.categories.length ,
                            itemBuilder:(context,index){
                              return Container(
                                color:Colors.grey,
                                child: Column(
                                  children: [
                                    Text(cubit.categories[index].name.toString()),
                                    Image.network(cubit.categories[index].image),
                                  ],
                                ),
                              );
                            }),
                      );
                      ;
                    }


                )


              ],
            ),
          ],
        ),
      ),
    );
  }
}
