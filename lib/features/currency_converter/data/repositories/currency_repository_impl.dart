

import 'package:dartz/dartz.dart';

import 'package:test2/core/errors/failures.dart';

import 'package:test2/features/currency_converter/domain/entities/currency.dart';

import '../../../../core/errors/exceptions.dart';

import '../../domain/repositories/currency_repository.dart';
import '../datasources/currency_remote_data_source.dart';

class CurrencyRepositoryImpl implements CurrencyRepository{
  final CurrencyRemoteDataSource dataSource;
  CurrencyRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Currency>> convertCurrency({
    required String from,
    required String to,
    required double amount})
  async{
    try{
      final remoteCurrency = await dataSource.convertCurrency(
        from: from,
        to: to,
        amount: amount,
      );
      return Right(remoteCurrency);
    } on ServerException catch (e) {
      return Left(ServerFailure('Error occurred while converting currency'));
    }catch (e) {
      return Left(ServerFailure(e.toString()));
    }

  }
  
}