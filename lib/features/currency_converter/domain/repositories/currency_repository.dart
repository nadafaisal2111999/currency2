import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, Currency>> convertCurrency({
    required String from,
    required String to,
    required double amount,
  });
}