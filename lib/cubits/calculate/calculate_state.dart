class CalculateState {
  final int firstNumber;
  final int secondNumber;
  final int answer;

  CalculateState(
      {this.firstNumber = 0, this.secondNumber = 0, this.answer = 0});
  CalculateState copyWith({
    int? firstNumber,
    int? secondNumber,
    int? answer,
  }) =>
      CalculateState(
          firstNumber: firstNumber ?? this.firstNumber,
          secondNumber: secondNumber ?? this.secondNumber,
          answer: answer ?? this.answer);

  factory CalculateState.fromJson(Map<String, dynamic> json) {
    return CalculateState(
        firstNumber: json["firstNumber"] as int? ?? 0,
        secondNumber: json["secondNumber"] as int? ?? 0,
        answer: json["answer"] as int? ?? 0);
  }

  @override
  String toString() {
    return '''
    FirstNumber: $firstNumber
    SecondNumber: $secondNumber
    Answer: $answer
    ''';
  }
}
