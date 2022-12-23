import 'package:flutter/foundation.dart';
import 'package:statement_analysis/service/analysis/models/spending.dart';
import 'package:statement_analysis/service/analysis/models/bank_statement.dart';
import 'package:statement_analysis/service/analysis/usecase/analysis_data_usecase.dart';
import 'package:statement_analysis/app/data/extension/date.dart';

Future<List<PerDaySpending>> _perDaySpending(
    BankStatement bankStatement) async {
  final perDaySpendingList = <PerDaySpending>[];
  DateTime? date;
  for (final transaction in bankStatement.transactionDetails) {
    if (transaction.transactionType == 'C') break;
    if (!(date?.isSameDate(transaction.transactionDate) ?? false)) {
      date = transaction.transactionDate;
      perDaySpendingList.add(PerDaySpending(date, transaction.amount));
    } else {
      perDaySpendingList.last = perDaySpendingList.last.copyWith(
          amount: perDaySpendingList.last.amount + transaction.amount);
    }
  }
  perDaySpendingList.sort((a, b) => a.date.compareTo(b.date));
  print(perDaySpendingList.length);
  return perDaySpendingList;
}

class AnalysisDataDatasource implements AnalysisDataUsecase {
  @override
  Future<List<PerDaySpending>> perDaySpending(
      BankStatement bankStatement) async {
    return await compute(_perDaySpending, bankStatement);
  }
}
