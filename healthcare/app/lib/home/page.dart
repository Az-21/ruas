import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        title: const Text("Maternal Health Risk Classifier"),
        actions: [IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.info))],
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Age
        ListTile(
          leading: const Icon(Icons.face),
          title: TextField(
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
              onPressed: () {},
              icon: const Icon(Icons.restore),
              label: const Text("Reset"),
            ),
            const SizedBox(width: 16),
            FilledButton.tonalIcon(
              onPressed: () {},
              icon: const Icon(Icons.check_circle),
              label: const Text("Estimate"),
            ),
          ],
        ),

        // Output classification
        ListTile(
          leading: const Icon(Icons.category),
          title: const Text("Risk Category"),
          subtitle: Text("TODO"),
        ),

        // Confidence scores
        ListTile(
          leading: const Icon(Icons.speed),
          title: const Text("Confidence"),
          subtitle: Text("TODO"),
        )
      ],
    );
  }
}
