import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../service/analysis/models/spending.dart';
import '../controllers/analysis_controller.dart';

class AnalysisView extends GetView<AnalysisController> {
  const AnalysisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('AnalysisView'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.loading.value
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const LinearProgressIndicator(),
                )
              : FutureBuilder<List<PerDaySpending>>(
                  future: controller.perDaySpending,
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return Text(snapshot.error.toString());
                    else if (snapshot.connectionState ==
                        ConnectionState.waiting)
                      return const Center(child: CircularProgressIndicator());
                    else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) =>
                            tile(snapshot.data![index], index),
                      );
                    } else
                      return const Text('No data');
                  },
                ),
        ),
      );

  Widget tile(PerDaySpending spending, int i) => Card(
        child: ListTile(
          leading: CircleAvatar(
              child: Center(
                  child: Text(
            '${spending.date.day}',
          ))),
          title: Text('₹ ${spending.amount}'),
          subtitle: Text(
              '${spending.date.day}/${spending.date.month}/${spending.date.year}'),
        ),
      );
}
