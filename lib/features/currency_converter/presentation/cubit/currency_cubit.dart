import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/convert_currency.dart';
import 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final ConvertCurrency convertCurrencyUseCase;

  CurrencyCubit({required this.convertCurrencyUseCase}) : super(CurrencyInitial());

  Future<void> convert({
    required String from,
    required String to,
    required double amount,
  }) async {
    emit(CurrencyLoading());

    final result = await convertCurrencyUseCase(
      from: from,
      to: to,
      amount: amount,
    );

    result.fold(
          (failure) => emit(CurrencyFailure(failure.message)),
          (currency) => emit(CurrencySuccess(currency)),
    );
  }
}