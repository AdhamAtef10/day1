part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartAddSuccessState extends CartState {}
class CartRemoveSuccessState extends CartState {}


