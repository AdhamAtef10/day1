import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:day1/models/product/product.dart';
import 'package:day1/services/shared-prefrence/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../services/dio/dio_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];
  ProductHub? _productHub;

  getProductsByCategory(int id ) {
    emit(ProductLoadingState());
    DioHelper.getData(
      url: 'product',
      query: {
        'category':id
      },
      token: SharedPreferencesHelper.getData(key:'token'),
    ).then((value) {
      var jsonData = jsonDecode(value.data);
      _productHub = ProductHub.fromJson(jsonData);
      for (var product in _productHub!.data!)
      {
       products.add(product);
      }
      emit(ProductSuccessState());
    }).catchError((error) {
      print(error);
      emit(ProductErrorState());
    });
  }

}
