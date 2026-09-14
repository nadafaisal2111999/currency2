import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/currency.dart';
import '../repositories/currency_repository.dart';

class ConvertCurrency {
  final CurrencyRepository repository;

  ConvertCurrency(this.repository);

  Future<Either<Failure, Currency>> call({
    required String from,
    required String to,
    required double amount,
  }) async {
    return await repository.convertCurrency(
      from: from,
      to: to,
      amount: amount,
    );
  }
}