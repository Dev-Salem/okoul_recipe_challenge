// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:okoul_recipe_challenge/core/network/error_message.dart';

class NetworkException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const NetworkException({
    required this.errorMessageModel,
  });
}

class StorageException implements Exception {
  final String errorMessage;

  const StorageException({required this.errorMessage});
}
