class Currency {
  final String baseCode; // رمز العملة الأساسية
  final String targetCode; // رمز العملة الهدف
  final double conversionRate; // معدل التحويل
  final double conversionResult; // نتيجة التحويل

  Currency({
    required this.baseCode,
    required this.targetCode,
    required this.conversionRate,
    required this.conversionResult,
  });
}