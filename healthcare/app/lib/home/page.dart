import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mhrc/home/svm_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        title: const Text("Maternal Health Risk Classifier"),
      ),
      body: Classifier(),
    );
  }
}

class Classifier extends StatefulWidget {
  const Classifier({super.key});

  @override
  State<Classifier> createState() => _ClassifierState();
}

class _ClassifierState extends State<Classifier> {
  // Inputs
  var age = TextEditingController();
  var pressureS = TextEditingController();
  var pressureD = TextEditingController();
  var sugar = TextEditingController();
  var temperature = TextEditingController();
  var heartRate = TextEditingController();

  // Outputs
  String category = "";
  String confidence = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Age
        ListTile(
          leading: const Icon(Icons.face),
          title: TextField(
            controller: age,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Age",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*'))],
          ),
        ),

        // BP (S)
        ListTile(
          leading: const Icon(Icons.move_up),
          title: TextField(
            controller: pressureS,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Systolic Blood Pressure",
              suffixText: "mmHg",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*'))],
          ),
        ),

        // BP (D)
        ListTile(
          leading: const Icon(Icons.move_down),
          title: TextField(
            controller: pressureD,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Diastolic Blood Pressure",
              suffixText: "mmHg",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*'))],
          ),
        ),

        // Blood sugar
        ListTile(
          leading: const Icon(Icons.bloodtype),
          title: TextField(
            controller: sugar,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Blood Sugar",
              suffixText: "mmol/L",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*'))],
          ),
        ),

        // Body temperature
        ListTile(
          leading: const Icon(Icons.thermostat),
          title: TextField(
            controller: temperature,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Body Temperature",
              suffixText: "F",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*'))],
          ),
        ),

        // Heart rate
        ListTile(
          leading: const Icon(Icons.monitor_heart),
          title: TextField(
            controller: heartRate,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Heart Rate",
              suffixText: "BPM",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*'))],
          ),
        ),

        // Action Buttons
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonalIcon(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onError),
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.error),
              ),
              onPressed: resetFields,
              icon: const Icon(Icons.restore),
              label: const Text("Reset"),
            ),
            const SizedBox(width: 16),
            FilledButton.tonalIcon(
              onPressed: runClassifier,
              icon: const Icon(Icons.check_circle),
              label: const Text("Estimate"),
            ),
          ],
        ),

        // Output classification
        ListTile(
          leading: const Icon(Icons.category),
          title: const Text("Risk Category"),
          subtitle: Text(category),
        ),

        // Confidence scores
        ListTile(
          leading: const Icon(Icons.speed),
          title: const Text("Confidence"),
          subtitle: Text(confidence),
        )
      ],
    );
  }

  void resetFields() {
    age.text = "";
    pressureS.text = "";
    pressureD.text = "";
    sugar.text = "";
    temperature.text = "";
    heartRate.text = "";
    category = "";
    confidence = "";
    setState(() {
      category = "";
      confidence = "";
    });
  }

  void setToZeroIfEmpty(TextEditingController field) {
    if (field.text == "") field.text = "0";
  }

  void ensureFieldsAreNotEmpty() {
    setToZeroIfEmpty(age);
    setToZeroIfEmpty(pressureS);
    setToZeroIfEmpty(pressureD);
    setToZeroIfEmpty(sugar);
    setToZeroIfEmpty(temperature);
    setToZeroIfEmpty(heartRate);
  }

  void runClassifier() {
    ensureFieldsAreNotEmpty();
    FeatureVector x = (
      age: double.parse(age.text),
      pressureS: double.parse(pressureS.text),
      pressureD: double.parse(pressureD.text),
      sugar: double.parse(sugar.text),
      temperature: double.parse(temperature.text),
      heartRate: double.parse(heartRate.text),
    );

    Classification output = classify(x);
    setState(() {
      category = output.category;
      confidence = output.confidence;
    });
  }
}
