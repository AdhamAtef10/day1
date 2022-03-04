part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoadingState extends ProductState {}
class ProductSuccessState extends ProductState {}
class ProductErrorState extends ProductState {}


