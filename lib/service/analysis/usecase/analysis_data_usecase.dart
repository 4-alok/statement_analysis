import 'package:statement_analysis/service/analysis/models/bank_statement.dart';
import 'package:statement_analysis/service/analysis/models/spending.dart';

abstract class AnalysisDataUsecase {
  Future<List<PerDaySpending>> perDaySpending(BankStatement bankStatement);
}