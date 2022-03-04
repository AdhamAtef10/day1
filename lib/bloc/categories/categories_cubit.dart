import 'dart:convert';
import 'package:day1/models/categories/categories.dart';
import 'package:day1/services/dio/dio_service.dart';
import 'package:day1/services/shared-prefrence/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);
  List<Category> categories = [];
  CategoriesHub  ?categoriesHub;
  getAllCategories() {
    print('hello 1 ');
    emit(CategoriesLoadingState());
    DioHelper.getData(
        url: 'categories',
      token: SharedPreferencesHelper.getData(key:'token'),
    ).then((value) {
      print('hello 2 ');
      var jsonData = jsonDecode(value.data);
      categoriesHub = CategoriesHub.fromJson(jsonData);
      for (var category in categoriesHub!.data!)
      {
        categories.add(category);
      }
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error);
      emit(CategoriesErrorState());
    });
  }

}