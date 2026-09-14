
 import 'package:test2/core/network/api_client.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/currency_model.dart';

abstract class CurrencyRemoteDataSource { // abstract class عشان نعمل interface
  Future <CurrencyModel> convertCurrency({
    required String from , // العملة الاساسية
    required String to, // العملة المستهدفة
    required double amount, // المبلغ المراد تحويله
 });
 }
 class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource{

  final ApiClient apiClient; // عشان نقدر نستخدم ال apiClient في الداتا سورس

  CurrencyRemoteDataSourceImpl(this.apiClient);

  @override
  Future<CurrencyModel> convertCurrency({
    required String from,
    required String to,
    required double amount})
  async{
    try{
      final response = await apiClient.dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.apiKey}/pair/$from/$to/$amount',
      );
      if (response.statusCode == 200) {
        return CurrencyModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to convert currency');
      }
    } catch (e) {
      throw ServerException('Error occurred while converting currency');
    }
  }



 }