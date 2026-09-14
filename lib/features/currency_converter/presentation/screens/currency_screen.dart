import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_client.dart';
import 'currency_body.dart';
import '../cubit/currency_cubit.dart';
import '../../data/datasources/currency_remote_data_source.dart';
import '../../data/repositories/currency_repository_impl.dart';
import '../../domain/usecases/convert_currency.dart';


class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('محول العملات'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          final apiClient = ApiClient(Dio());
          final dataSource = CurrencyRemoteDataSourceImpl(apiClient);
          final repository = CurrencyRepositoryImpl(dataSource);
          final useCase = ConvertCurrency(repository);

          return CurrencyCubit(convertCurrencyUseCase: useCase);
        },
        child: const CurrencyBody(),
      ),
    );
  }
}