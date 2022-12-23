import '../models/bank_statement.dart';

abstract class FileTaskUsecase {
  Future<BankStatement> readFileToBankStatement(String path);
}
