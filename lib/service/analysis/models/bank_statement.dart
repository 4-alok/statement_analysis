// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

class BankStatement {
  final UserAccountInfo userAccountInfo;
  final List<TransactionDetails> transactionDetails;
  const BankStatement(
      {required this.userAccountInfo, required this.transactionDetails});

  BankStatement copyWith(
          {UserAccountInfo? userAccountInfo,
          List<TransactionDetails>? transactionDetails}) =>
      BankStatement(
          userAccountInfo: userAccountInfo ?? this.userAccountInfo,
          transactionDetails: transactionDetails ?? this.transactionDetails);

  @override
  String toString() =>
      'BankStatement(userAccountInfo: $userAccountInfo, transactionDetails: $transactionDetails)';

  @override
  bool operator ==(covariant BankStatement other) => identical(this, other)
      ? true
      : other.userAccountInfo == userAccountInfo &&
          listEquals(other.transactionDetails, transactionDetails);

  @override
  int get hashCode => userAccountInfo.hashCode ^ transactionDetails.hashCode;
}

class UserAccountInfo {
  final String accountHolderName;
  final String accountNumber;
  final String? ifscCode;
  final String? bankName;
  final String? accountType;
  final String? branchName;
  final String? micrCode;
  final double? openingBalance;
  final double? closingBalance;
  const UserAccountInfo(
      {required this.accountHolderName,
      required this.accountNumber,
      this.ifscCode,
      this.bankName,
      this.accountType,
      this.branchName,
      this.micrCode,
      this.openingBalance,
      this.closingBalance});

  UserAccountInfo copyWith(
          {String? accountHolderName,
          String? accountNumber,
          String? ifscCode,
          String? bankName,
          String? accountType,
          String? branchName,
          String? micrCode,
          double? openingBalance,
          double? closingBalance}) =>
      UserAccountInfo(
          accountHolderName: accountHolderName ?? this.accountHolderName,
          accountNumber: accountNumber ?? this.accountNumber,
          ifscCode: ifscCode ?? this.ifscCode,
          bankName: bankName ?? this.bankName,
          accountType: accountType ?? this.accountType,
          branchName: branchName ?? this.branchName,
          micrCode: micrCode ?? this.micrCode,
          openingBalance: openingBalance ?? this.openingBalance,
          closingBalance: closingBalance ?? this.closingBalance);

  @override
  bool operator ==(covariant UserAccountInfo other) => identical(this, other)
      ? true
      : other.accountHolderName == accountHolderName &&
          other.accountNumber == accountNumber &&
          other.ifscCode == ifscCode &&
          other.bankName == bankName &&
          other.accountType == accountType &&
          other.branchName == branchName &&
          other.micrCode == micrCode &&
          other.openingBalance == openingBalance &&
          other.closingBalance == closingBalance;

  @override
  int get hashCode =>
      accountHolderName.hashCode ^
      accountNumber.hashCode ^
      ifscCode.hashCode ^
      bankName.hashCode ^
      accountType.hashCode ^
      branchName.hashCode ^
      micrCode.hashCode ^
      openingBalance.hashCode ^
      closingBalance.hashCode;

  @override
  String toString() =>
      'UserAccountInfo(accountHolderName: $accountHolderName, accountNumber: $accountNumber, ifscCode: $ifscCode, bankName: $bankName, accountType: $accountType, branchName: $branchName, micrCode: $micrCode, openingBalance: $openingBalance, closingBalance: $closingBalance)';
}

enum TransactionType { debit, credit }

class TransactionDetails {
  final String? transactionId;
  final DateTime transactionDate;
  final List<String> narration;
  final double amount;
  final TransactionType transactionType;
  final double availableBalance;
  final String? benefeiciaryAccountNumber;
  final String? benefeiciaryName;
  final String? remitterAccountNumber;
  final String? remitterName;
  final String? remak;
  const TransactionDetails(
      {this.transactionId,
      required this.transactionDate,
      required this.narration,
      required this.amount,
      required this.transactionType,
      required this.availableBalance,
      this.benefeiciaryAccountNumber,
      this.benefeiciaryName,
      this.remitterAccountNumber,
      this.remitterName,
      this.remak});

  TransactionDetails copyWith(
          {String? transactionId,
          DateTime? transactionDate,
          List<String>? narration,
          double? amount,
          TransactionType? transactionType,
          double? availableBalance,
          String? benefeiciaryAccountNumber,
          String? benefeiciaryName,
          String? remitterAccountNumber,
          String? remitterName,
          String? remak}) =>
      TransactionDetails(
          transactionId: transactionId ?? this.transactionId,
          transactionDate: transactionDate ?? this.transactionDate,
          narration: narration ?? this.narration,
          amount: amount ?? this.amount,
          transactionType: transactionType ?? this.transactionType,
          availableBalance: availableBalance ?? this.availableBalance,
          benefeiciaryAccountNumber:
              benefeiciaryAccountNumber ?? this.benefeiciaryAccountNumber,
          benefeiciaryName: benefeiciaryName ?? this.benefeiciaryName,
          remitterAccountNumber:
              remitterAccountNumber ?? this.remitterAccountNumber,
          remitterName: remitterName ?? this.remitterName,
          remak: remak ?? this.remak);

  @override
  String toString() =>
      'TransactionDetails(transactionId: $transactionId, transactionDate: $transactionDate, narration: $narration, amount: $amount, transactionType: $transactionType, availableBalance: $availableBalance, benefeiciaryAccountNumber: $benefeiciaryAccountNumber, benefeiciaryName: $benefeiciaryName, remitterAccountNumber: $remitterAccountNumber, remitterName: $remitterName, remak: $remak)';

  @override
  bool operator ==(covariant TransactionDetails other) => identical(this, other)
      ? true
      : other.transactionId == transactionId &&
          other.transactionDate == transactionDate &&
          listEquals(other.narration, narration) &&
          other.amount == amount &&
          other.transactionType == transactionType &&
          other.availableBalance == availableBalance &&
          other.benefeiciaryAccountNumber == benefeiciaryAccountNumber &&
          other.benefeiciaryName == benefeiciaryName &&
          other.remitterAccountNumber == remitterAccountNumber &&
          other.remitterName == remitterName &&
          other.remak == remak;

  @override
  int get hashCode =>
      transactionId.hashCode ^
      transactionDate.hashCode ^
      narration.hashCode ^
      amount.hashCode ^
      transactionType.hashCode ^
      availableBalance.hashCode ^
      benefeiciaryAccountNumber.hashCode ^
      benefeiciaryName.hashCode ^
      remitterAccountNumber.hashCode ^
      remitterName.hashCode ^
      remak.hashCode;
}
