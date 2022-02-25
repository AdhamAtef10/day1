import 'package:day1/bloc/categories/categories_cubit.dart';
import 'package:day1/bloc/login/login_cubit.dart';
import 'package:day1/bloc/register/register_cubit.dart';
import 'package:day1/views/home_screen/home_view.dart';
import 'package:day1/views/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>RegisterCubit()),
        BlocProvider(create: (BuildContext context) =>LoginCubit()),
        BlocProvider(create: (BuildContext context) =>CategoriesCubit()),
      ],
      child:MaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
