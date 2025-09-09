import 'package:dairy_app/features/milk_collection/model/get_cust_details/get_cust_details_request.dart';
import 'package:dio/dio.dart';

import '../model/get_cust_details/get_cust_details_response.dart';

class GetCustDtlsApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dairyapp.codeclause.com/public/api',
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer YOUR_TOKEN', // Uncomment if needed
      },
    ),
  );

  Future<GetCustDetailsResponse> getCustDtlsApiCall(
      {required GetCustDetailsRequestBody code}) async {
    try {
      final response = await _dio.post(
        '/getCustomerDetails',
        data: code.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Milk collection submitted successfully!');
        print('Response: ${response.data}');
        return GetCustDetailsResponse.fromJson(response.data);
      } else {
        print('Failed to submit. Status Code: ${response.statusCode}');
        return GetCustDetailsResponse();
      }
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.response?.data ?? e.message}');
        rethrow;
      } else {
        print('Unexpected error: $e');
        rethrow;
      }
    }
  }
}
