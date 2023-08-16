import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/core/util/input_converter.dart';

void main(){
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () { 
    test('shoud return an integer when the string reperesents an unsigned integer', () {
      // arrange

      const str = "123";
      // act
      final result = inputConverter.stringToUnsignedInteget(str);

      // assert
      expect(result, const Right(123));

    });
    test('shoud return a failure when the string is not an integer', () {
      // arrange

      const str = "abc";
      // act
      final result = inputConverter.stringToUnsignedInteget(str);

      // assert
      expect(result, Left(InvalidInputFailure()));

    });

    test('shoud return a failure when the string is a negetive integer', () {
      // arrange

      const str = "-123";
      // act
      final result = inputConverter.stringToUnsignedInteget(str);

      // assert
      expect(result, Left(InvalidInputFailure()));
    });

   
  });
}





