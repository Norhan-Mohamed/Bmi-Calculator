class BmiCalc {
  int weight = 50;
  int height = 160;
  int age = 20;
  double bmi = 0.0;

  calculator() {
    bmi = weight / (height / 100.2);
    if (bmi != 0) {
      return bmi;
    } else {
      return 0;
    }
  }

  bmiResult maleInterpretation(double result) {
    if (bmi < 20) {
      return bmiResult(
          state: "under_weight",
          result: result.toStringAsFixed(1),
          statement: "you are under weight");
    } else if (bmi >= 20 && bmi <= 24.9) {
      return bmiResult(
          state: "normal",
          result: result.toStringAsFixed(1),
          statement: "you have a normal body weight");
    } else if (bmi >= 25 && bmi <= 29.9) {
      return bmiResult(
          state: "over weight",
          result: result.toStringAsFixed(1),
          statement: "you are over weight");
    } else if (bmi >= 30) {
      return bmiResult(
          state: "obesity",
          result: result.toStringAsFixed(1),
          statement: "ypu need to take more care about your health");
    }
    throw '';
  }

  bmiResult femaleInterpretation(double result) {
    if (bmi < 19) {
      return bmiResult(
          state: "under_weight",
          result: result.toStringAsFixed(1),
          statement: "you are under weight");
    } else if (bmi >= 20 && bmi <= 24.9) {
      return bmiResult(
          state: "normal",
          result: result.toStringAsFixed(1),
          statement: "you have a normal body weight");
    } else if (bmi >= 25 && bmi <= 29.9) {
      return bmiResult(
          state: "over weight",
          result: result.toStringAsFixed(1),
          statement: "you are over weight");
    } else if (bmi >= 30) {
      return bmiResult(
          state: "obesity",
          result: result.toStringAsFixed(1),
          statement: "ypu need to take more care about your health");
    }
    throw '';
  }
}

class bmiResult {
  bmiResult({
    required this.state,
    required this.result,
    required this.statement,
  });
  String state;
  String result;
  String statement;
}
