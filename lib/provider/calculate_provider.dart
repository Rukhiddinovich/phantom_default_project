import 'dart:math';

import 'package:flutter/material.dart';
class CalculateProvider with ChangeNotifier{

  num answer = 0;

  CalculateProvider();

  getAnswer() => answer;
  void clear(){
    answer=0;
    notifyListeners();
  }

  void add(int a, int b) {
    answer = a + b;
    notifyListeners();
  }

  void subtraction(int a, int b) {
    answer = a - b;
    notifyListeners();
  }

  void multiplication(int a, int b) {
    answer = a * b;
    notifyListeners();
  }

  void division(int a, int b) {
    answer = a / b;
    notifyListeners();
  }

  void middleArithmetic(int a, int b) {
    answer = (a + b) / 2;
    notifyListeners();
  }

  void mediumGeometric(int a, int b) {
    answer = sqrt(a * b);
    notifyListeners();
  }

  void sumOfNumbers(int a, int b) {
    answer = 0;
    while (a != 0) {
      answer += a % 10;
      a ~/= 10;
    }

    while (b != 0) {
      answer += b % 10;
      b ~/= 10;
    }
    notifyListeners();
  }
}