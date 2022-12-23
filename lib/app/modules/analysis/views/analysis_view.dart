import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/analysis_controller.dart';

class AnalysisView extends GetView<AnalysisController> {
  const AnalysisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('AnalysisView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                controller.path.value ?? "",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.test(),
              child: const Text("Pick File"),
            ),
          ],
        ),
      );
}
