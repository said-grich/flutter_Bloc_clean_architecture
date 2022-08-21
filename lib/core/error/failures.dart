import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  
  @override
  List<Object?> get props => throw UnimplementedError();
  
}

class ServerFailure extends Failure {
  
}

class CacheFailure extends Failure {
  
}

