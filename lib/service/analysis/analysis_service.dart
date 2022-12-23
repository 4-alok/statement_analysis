import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import 'datasources/file_task.dart';

class AnalysisService extends GetxService {
  final fileTask = FileTaskDatasource();
}