part of 'shop_bloc.dart';

class ShopState extends Equatable {
  final FormStatus status;
  final List<ShopModel> products;
  final String statusText;

  const ShopState(
      {required this.status, required this.products, required this.statusText});

  ShopState copyWith({
    FormStatus? status,
    List<ShopModel>? products,
    String? statusText,
  }) =>
      ShopState(
          status: status ?? this.status,
          products: products ?? this.products,
          statusText: statusText ?? this.statusText);

  @override
  List<Object?> get props => [status, products, statusText];
}
