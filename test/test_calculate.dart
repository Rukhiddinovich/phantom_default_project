import 'package:default_project/test/calculate_function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calculateAddition', () {
    final sut = TestCalculate();
    expect(sut.calculateAddition(2, 3), 5);
  });

  test('calculateAddition', () {
    final sut = TestCalculate();
    expect(sut.calculateSubtraction(2, 3), -1);
  });

  test('calculateAddition', () {
    final sut = TestCalculate();
    expect(sut.calculateDistribution(8, 2), 4);
  });

  test('calculateAddition', () {
    final sut = TestCalculate();
    expect(sut.calculateMultiplication(2, 3), 6);
  });
}
// 7852
// 946365545 -> Kenayishka