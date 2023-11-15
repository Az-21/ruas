import 'package:flutter/material.dart';

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
    );
  }
}
