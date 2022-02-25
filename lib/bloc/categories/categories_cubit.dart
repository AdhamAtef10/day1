import 'package:day1/models/categories/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<Categories> categories= [
    Categories(
       image: 'https://ar.wikipedia.org/wiki/%D8%A8%D8%B7%D9%8A%D8%AE_%D8%A3%D8%AD%D9%85%D8%B1#/media/%D9%85%D9%84%D9%81:Wassermelone.jpg',
      id:1 ,
      name: 'bate5 1',
    ),
    Categories(
       image: 'https://ar.wikipedia.org/wiki/%D8%A8%D8%B7%D9%8A%D8%AE_%D8%A3%D8%AD%D9%85%D8%B1#/media/%D9%85%D9%84%D9%81:Wassermelone.jpg',
      id:2 ,
      name: 'bate5 2',
    ),
    Categories(
      image: 'https://ar.wikipedia.org/wiki/%D8%A8%D8%B7%D9%8A%D8%AE_%D8%A3%D8%AD%D9%85%D8%B1#/media/%D9%85%D9%84%D9%81:Wassermelone.jpg',
      id:3 ,
      name: 'bate5 3',
    ),
    Categories(
      image: 'https://ar.wikipedia.org/wiki/%D8%A8%D8%B7%D9%8A%D8%AE_%D8%A3%D8%AD%D9%85%D8%B1#/media/%D9%85%D9%84%D9%81:Wassermelone.jpg',
      id:4 ,
      name: 'bate5 4',
    ),
  ];
}
