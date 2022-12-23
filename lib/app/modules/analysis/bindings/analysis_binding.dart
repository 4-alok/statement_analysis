// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../controllers/analysis_controller.dart';

class AnalysisBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<AnalysisController>(
        () => AnalysisController(),
      );
}
