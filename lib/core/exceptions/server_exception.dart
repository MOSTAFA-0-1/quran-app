import 'package:quran/core/errors/error_masage_model.dart';

class ServerException implements Exception {
  ErrorMassageModel errorMassageModel;
  ServerException({required this.errorMassageModel});
}
class DatabaseException implements Exception {
  ErrorMassageModel errorMassageModel;
  DatabaseException({required this.errorMassageModel});
}
