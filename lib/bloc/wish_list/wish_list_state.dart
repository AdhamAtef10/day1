part of 'wish_list_cubit.dart';

@immutable
abstract class WishListState {}

class WishListInitial extends WishListState {}
class WishListAddSuccessState extends WishListState {}
class WishListRemoveSuccessState extends WishListState {}


