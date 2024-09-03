// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;
  const Failure({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message: message);
}

class CasheFailure extends Failure {
  const CasheFailure({required String message}) : super(message: message);
}
