import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteget(String str){
    try{
      final integer = int.parse(str);
      if( integer < 0) throw const FormatException();
      return Right(integer);
    } on FormatException{
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure{
  @override
  List<Object?> get props => [];

}