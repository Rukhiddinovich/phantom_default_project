import 'package:default_project/bloc/country_event.dart';
import 'package:default_project/bloc/country_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/api/api.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc({required CountryApiClient productApiClient})
      : _productApiClient = productApiClient,
        super(CountryLoadInProgress()) {
    on<CountryFetchStarted>(_onProductsFetchStarted);
  }

  final CountryApiClient _productApiClient;

  Future<void> _onProductsFetchStarted(
    CountryFetchStarted event,
    Emitter<CountryState> emit,
  ) async {
    emit(CountryLoadInProgress());
    try {
      final products = await _productApiClient.getCountry();
      emit(CountryLoadSuccess(products));
    } catch (error) {
      debugPrint("ERRROR:$error");
      emit(CountryLoadFailure());
    }
  }
}
