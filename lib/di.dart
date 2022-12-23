import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:statement_analysis/service/analysis/analysis_service.dart';

Future<void> get init async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  Get.put<AnalysisService>(AnalysisService());
}
