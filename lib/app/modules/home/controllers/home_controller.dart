import 'package:get/get.dart';
import 'package:statement_analysis/app/routes/app_pages.dart';

import '../../../data/utils/import_csv.dart';

class HomeController extends GetxController {
  Future<void> get pickCsvFile async {
    final csvFilePath = await csvFilePicker;
    Get.toNamed(Routes.ANALYSIS, arguments: csvFilePath);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
