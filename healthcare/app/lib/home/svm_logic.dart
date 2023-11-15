import 'dart:math';
import 'package:flutter/foundation.dart';

typedef FeatureVector = ({
  double age,
  double pressureS,
  double pressureD,
  double sugar,
  double temperature,
  double heartRate,
});

typedef SvmModelAttribute = ({
  double bias,
  double age,
  double pressureS,
  double pressureD,
  double sugar,
  double temperature,
  double heartRate,
});

const SvmModelAttribute riskClassLow = (
  bias: -100.03782366,
  age: -0.00540497,
  pressureS: 0.07666348,
  pressureD: 0.01207365,
  sugar: 0.57739635,
  temperature: 0.85019234,
  heartRate: 0.01780048,
);

const SvmModelAttribute riskClassMedium = (
  bias: -28.66955583,
  age: -0.00601977,
  pressureS: 0.00449086,
  pressureD: 0.03363375,
  sugar: 0.29619415,
  temperature: 0.19620614,
  heartRate: 0.04471379,
);

const SvmModelAttribute riskClassHigh = (
  bias: 51.37882767,
  age: -0.00195045,
  pressureS: -0.05715203,
  pressureD: 0.05255499,
  sugar: -0.22672393,
  temperature: -0.46292397,
  heartRate: -0.01846782,
);

double perceptron(FeatureVector x, SvmModelAttribute w) {
  return w.bias +
      x.age * w.age +
      x.pressureS * w.pressureS +
      x.pressureD * w.pressureD +
      x.sugar * w.sugar +
      x.temperature * w.temperature +
      x.heartRate * w.heartRate;
}

typedef Classification = ({
  String category,
  String confidence,
});

Classification classify(FeatureVector x) {
  double lowRiskScore = perceptron(x, riskClassLow);
  double mediumRiskScore = perceptron(x, riskClassMedium);
  double highRiskScore = perceptron(x, riskClassHigh);

  List<double> scores = [lowRiskScore, mediumRiskScore, highRiskScore];
  if (kDebugMode) {
    print(scores);
  }
  scores.sort();
  double max = scores[2];

  // Confidence score calculation using softmax function
  double nConfidence = 100 * exp(max) / (exp(lowRiskScore) + exp(mediumRiskScore) + exp(highRiskScore));
  String confidence = "${nConfidence.toStringAsFixed(2)}%";

  // Category assignment
  String category = "";
  if (max == lowRiskScore) {
    category = "Low Risk";
  } else if (max == mediumRiskScore) {
    category = "Medium Risk";
  } else {
    category = "High Risk";
  }

  Classification output = (category: category, confidence: confidence);
  return output;
}
