import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/product/product.dart';
part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  static WishListCubit get(context) => BlocProvider.of(context);

  List<Product> fav=[];
  int total=0;

  addToWishList(Product product ) {
    if (fav.length == 0) {
      fav.add(product);
    }
    else {
      bool found = false;
      for (int i = 0; i < fav.length; i++) {
        if (fav[i].id == product.id) {
          found = true;
          break;
        }
      }
      if (!found) {
        fav.add(product);
      }
      emit(WishListAddSuccessState());
    }
  }
  removeFromWishList(Product product)
  {
    fav.remove(product);
    emit(WishListRemoveSuccessState());
  }
}
