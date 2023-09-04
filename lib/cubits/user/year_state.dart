import 'package:default_project/data/models/year_model.dart';
import 'package:equatable/equatable.dart';

abstract class YearState extends Equatable {}

class YearInitial extends YearState {
  @override
  List<Object?> get props => [];
}

class YearLoadingState extends YearState {
  @override
  List<Object?> get props => [];
}

class YearSuccessState extends YearState {
  List<YearModel> yearModels;

  YearSuccessState({required this.yearModels});

  @override
  List<Object?> get props => [];
}

class YearErrorState extends YearState {
  final String errorText;

  YearErrorState({required this.errorText});

  @override
  List<Object?> get props => [];
}
