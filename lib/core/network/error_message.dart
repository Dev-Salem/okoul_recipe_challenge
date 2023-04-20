// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  const ErrorMessageModel(this.message);

  @override
  List<Object> get props => [message];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory ErrorMessageModel.fromMap(Map<String, dynamic> map) {
    return ErrorMessageModel(
      map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorMessageModel.fromJson(String source) =>
      ErrorMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
