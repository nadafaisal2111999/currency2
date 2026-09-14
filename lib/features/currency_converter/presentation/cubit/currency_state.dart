import 'package:equatable/equatable.dart';

import '../../domain/entities/currency.dart';

abstract class CurrencyState extends Equatable{
const CurrencyState();

  @override
  List<Object?> get props => []; // عشان نقدر نقارن بين الحالات المختلفة
}
class CurrencyInitial extends CurrencyState{}
class CurrencyLoading extends CurrencyState{}
class CurrencySuccess extends CurrencyState{
  final Currency currency;
  CurrencySuccess(this.currency);
  @override
  List<Object?> get props => [currency];
}
class CurrencyFailure extends CurrencyState{
  final String message;
  CurrencyFailure(this.message);
  @override
  List<Object?> get props => [message];
}
