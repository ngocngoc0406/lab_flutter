import 'dart:math';

class BmiCalculator {
  final int height;
  final int weight;

  BmiCalculator({required this.height, required this.weight});

  double _bmiValue = 0;

  String calculate() {
    _bmiValue = weight / pow(height / 100, 2);
    return _bmiValue.toStringAsFixed(1);
  }

  String getCategory() {
    if (_bmiValue >= 25) return 'Overweight';
    if (_bmiValue > 18.5) return 'Normal';
    return 'Underweight';
  }

  String getAdvice() {
    if (_bmiValue >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmiValue > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
