import 'package:get/get.dart';
import 'package:statement_analysis/service/analysis/analysis_service.dart';

class AnalysisController extends GetxController {
  final path = Rx<String?>(null);

  AnalysisService get analysisService => Get.find<AnalysisService>();

  @override
  void onInit() {
    path.value = Get.arguments as String;
    super.onInit();
  }

  void test() async {
    final statement = await analysisService.fileTask.readFileToBankStatement(path.value!);
    print(statement.transactionDetails.length);
  }

  @override
  void dispose() {
    path.close();
    super.dispose();
  }
}
