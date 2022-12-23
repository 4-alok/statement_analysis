import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:statement_analysis/service/analysis/models/bank_statement.dart';
import 'package:statement_analysis/service/analysis/usecase/file_task_usecase.dart';

const int userAccountInfoEndIndex = 12;
const int transactionDetailsRowSize = 12;

class FileTaskDatasource implements FileTaskUsecase {
  @override
  Future<BankStatement> readFileToBankStatement(String path) async {
    int n = 0;

    String accountHolderName = '';
    String accountNumber = '';
    String? ifscCode;
    String? bankName;
    String? accountType;
    String? branchName;
    String? micrCode;
    double? openingBalance;
    double? closingBalance;

    List<TransactionDetails> transactionDetails = [];
    final subscription = File(path)
        .openRead()
        .transform(utf8.decoder)
        .transform(const CsvToListConverter(fieldDelimiter: ','))
        .listen((line) {
      if (n < userAccountInfoEndIndex) {
        switch (n) {
          case 0:
            bankName = line.first;
            break;
          case 1:
            accountHolderName = line.last;
            break;
          case 2:
            accountNumber = line.last.toString();
            break;
          case 3:
            ifscCode = line.last;
            break;
          case 4:
            micrCode = line.last.toString();
            break;
          case 7:
            openingBalance = (line.last is String)
                ? (double.tryParse(line.last) ?? 0.0)
                : line.last;
            break;
          case 8:
            closingBalance = (line.last is String)
                ? (double.tryParse(line.last) ?? 0.0)
                : line.last;
            break;
          case 10:
            accountType = line.last;
            break;
        }
      } else {
        if (line.length == transactionDetailsRowSize) {
          transactionDetails.add(TransactionDetails(
            transactionId: line[0].toString(),
            transactionDate: DateFormat('dd-MM-yyyy HH:mm:ss').parse(line[1]),
            narration: (line[2] as String).split('\n'),
            amount: line[3] is double ? line[3] : (line[3] as int).toDouble(),
            transactionType:
                line[4] == 'D' ? TransactionType.debit : TransactionType.credit,
            availableBalance:
                line[6] is double ? line[6] : (line[6] as int).toDouble(),
            benefeiciaryAccountNumber: line[7].toString(),
            benefeiciaryName: line[8],
            remitterAccountNumber: line[9].toString(),
            remitterName: line[10],
            remak: line[11],
          ));
        }
      }
      n++;
    });

    await subscription.asFuture();
    await subscription.cancel();
    return BankStatement(
      userAccountInfo: UserAccountInfo(
        accountHolderName: accountHolderName,
        accountNumber: accountNumber,
        ifscCode: ifscCode,
        bankName: bankName,
        accountType: accountType,
        branchName: branchName,
        micrCode: micrCode,
        openingBalance: openingBalance,
        closingBalance: closingBalance,
      ),
      transactionDetails: transactionDetails,
    );
  }
}
