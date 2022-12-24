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
    if (transaction.transactionType == TransactionType.debit) {
      if (!(date?.isSameDate(transaction.transactionDate) ?? false)) {
        date = transaction.transactionDate;
        perDaySpendingList.add(PerDaySpending(date, transaction.amount));
      } else {
        perDaySpendingList.last = perDaySpendingList.last.copyWith(
            amount: perDaySpendingList.last.amount + transaction.amount);
      }
    }
  }
  perDaySpendingList.sort((a, b) => b.date.compareTo(a.date));
  return perDaySpendingList;
}

Future<List<WeeklySpending>> _weeklySpending(
    BankStatement bankStatement) async {
  final weeklySpendingList = <WeeklySpending>[];
  int weekOfYear = 0;
  for (final transaction in bankStatement.transactionDetails) {
    if (transaction.transactionType == TransactionType.debit) {
      if (transaction.transactionDate.weekOfYear != weekOfYear) {
        weekOfYear = transaction.transactionDate.weekOfYear;
        weeklySpendingList.add(WeeklySpending(
          firstDayOfWeek: weekOfYear.firstDayOfWeek,
          totalAmount: transaction.amount,
          weekOfYear: weekOfYear,
        ));
      } else {
        weeklySpendingList.last = weeklySpendingList.last.copyWith(
            totalAmount:
                weeklySpendingList.last.totalAmount + transaction.amount);
      }
    }
  }
  
  weeklySpendingList.sort((a, b) => a.weekOfYear.compareTo(b.weekOfYear));
  for (WeeklySpending w in weeklySpendingList) {
    print(w.firstDayOfWeek);
    print(w.totalAmount);
    print(w.weekOfYear);
    print("----");
  }
  return weeklySpendingList;
}

class AnalysisDataDatasource implements AnalysisDataUsecase {
  @override
  Future<List<PerDaySpending>> perDaySpending(
          BankStatement bankStatement) async =>
      await compute(_perDaySpending, bankStatement);

  @override
  Future<List<WeeklySpending>> weeklySpending(
          BankStatement bankStatement) async =>
      await compute(_weeklySpending, bankStatement);
}
