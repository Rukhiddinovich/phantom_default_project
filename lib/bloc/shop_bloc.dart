import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/local/db/local_database.dart';
import 'package:default_project/utils/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'shop_event.dart';

part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc()
      : super(const ShopState(
          status: FormStatus.pure,
          statusText: "",
          products: [],
        )) {
    on<AddProduct>(_addProduct);
    on<GetProduct>(_getProduct);
    on<UpdateProduct>(_updateProduct);
    on<DeleteProductEvent>(_deleteProduct);
  }

  List<ShopModel> newProduct = [];

  _addProduct(AddProduct event, Emitter<ShopState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.addProduct));
    await LocalDatabase.insertProducts(event.newProducts);
    emit(
      state.copyWith(
        statusText: StatusTextConstants.addProduct,
        status: FormStatus.success,
        products: [...state.products, event.newProducts],
      ),
    );
  }

  _getProduct(GetProduct event, Emitter<ShopState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.getProduct,
      ),
    );
    newProduct = await LocalDatabase.getAllProducts();
    emit(
      state.copyWith(
        statusText: StatusTextConstants.getProduct,
        status: FormStatus.success,
        products: newProduct,
      ),
    );
  }

  _updateProduct(UpdateProduct event, Emitter<ShopState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      await LocalDatabase.updateProducts(shopModel: event.newProduct);
      emit(state.copyWith(
        statusText: StatusTextConstants.updateProduct,
        status: FormStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  _deleteProduct(DeleteProductEvent event, Emitter<ShopState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      await LocalDatabase.deleteProducts(event.id);
      final products = await LocalDatabase.getAllProducts();
      emit(state.copyWith(
          statusText: StatusTextConstants.deleteProduct,
          products: products,
          status: FormStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }
}
