part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent extends Equatable {}

class AddProduct extends ShopEvent {
  final ShopModel newProducts;

  AddProduct({required this.newProducts});

  @override
  List<Object?> get props => [newProducts];
}

class GetProduct extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class DeleteAllProductEvent extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class DeleteProductEvent extends ShopEvent {
  final int id;

  DeleteProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class UpdateProduct extends ShopEvent {
  final ShopModel newProduct;

  UpdateProduct({required this.newProduct});

  @override
  List<Object?> get props => [newProduct];
}
