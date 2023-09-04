import '../data/models/country_model.dart';

abstract class CountryState {}

class CountryLoadInProgress extends CountryState {}

class CountryLoadSuccess extends CountryState {
  CountryLoadSuccess(this.products);

  final List<CountryModel> products;
}

class CountryLoadFailure extends CountryState {}
