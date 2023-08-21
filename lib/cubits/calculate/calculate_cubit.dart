import 'dart:math';

import 'package:default_project/cubits/calculate/calculate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(CalculateState());

  newFirstNumber(int newNum) {
    emit(state.copyWith(firstNumber: newNum));
    newAnswer();
  }

  newSecondNumber(int newNum) {
    emit(state.copyWith(secondNumber: newNum));
    newAnswer();
  }

  newAnswer() {
    emit(state.copyWith(
        answer: pow(state.firstNumber, state.secondNumber).toInt()));
  }
}
