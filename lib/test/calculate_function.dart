void main(List<String> arguments) {}

class TestCalculate {
  calculateAddition(int num1, int num2) {
    if (num1 > 0 && num2 > 0) {
      return (num1 + num2);
    }
    return 0;
  }

  calculateSubtraction(int num1, int num2) {
    if (num1 > 0 && num2 > 0) {
      return (num1 - num2);
    }
    return 0;
  }

  calculateMultiplication(int num1, int num2) {
    if (num1 > 0 && num2 > 0) {
      return (num1 * num2);
    }
    return 0;
  }

  calculateDistribution(int num1, int num2) {
    if (num1 > 0 && num2 > 0) {
      return (num1 / num2);
    }
    return 0;
  }
}
