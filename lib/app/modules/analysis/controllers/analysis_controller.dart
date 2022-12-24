import 'package:get/get.dart';
import 'package:statement_analysis/service/analysis/analysis_service.dart';
import 'package:statement_analysis/service/analysis/models/spending.dart';

import '../../../../service/analysis/models/bank_statement.dart';

class AnalysisController extends GetxController {
  final path = Rx<String?>(null);
  final loading = Rx<bool>(true);
  final statement = Rx<BankStatement?>(null);

  AnalysisService get analysisService => Get.find<AnalysisService>();

  @override
  void onInit() {
    path.value = Get.arguments as String;
    super.onInit();
  }

  @override
  void onReady() {
    analysisService.fileTask.readFileToBankStatement(path.value!).then((value) {
      loading.value = false;
      statement.value = value;
    });
    super.onReady();
  }

  Future<List<PerDaySpending>> get perDaySpending async =>
      statement.value == null
          ? []
          : await analysisService.analysisData.perDaySpending(statement.value!);

  Future<List<WeeklySpending>> get weeklySpending async =>
      statement.value == null
          ? []
          : await analysisService.analysisData.weeklySpending(statement.value!);

  @override
  void dispose() {
    path.close();
    loading.close();
    statement.close();
    super.dispose();
  }
}
