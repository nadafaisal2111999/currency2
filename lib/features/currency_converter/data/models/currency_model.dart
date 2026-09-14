import '../../domain/entities/currency.dart';

class CurrencyModel extends Currency {
  final String result;
  final String timeLastUpdateUtc;

  CurrencyModel({
    required this.result, // "success" or "error"
    required this.timeLastUpdateUtc, // "Mon, 01 Jan 2024 00:00:00 +0000"
    required super.baseCode,
    required super.targetCode,
    required super.conversionRate,
    required super.conversionResult,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      result: json['result'],
      timeLastUpdateUtc: json['time_last_update_utc'],
      baseCode: json['base_code'],
      targetCode: json['target_code'],
      conversionRate: (json['conversion_rate'] as num).toDouble(),
      conversionResult: (json['conversion_result'] as num).toDouble(),
    );
  }
}