import 'package:dairy_app/features/milk_collection/model/milk_collection_model.dart';
import 'package:dio/dio.dart';

class MilkCollectionApi {
  final Dio _dio = Dio();
  MilkCollectionApi();

  Future<MilkCollectionModel?> fetchMilkCollectionData() async {
    try {
      final response = await _dio.get(
          'https://dairyapp.codeclause.com/public/api/getDailyCollections');

      // Process successful response
      if (response.data.isNotEmpty) {
        return MilkCollectionModel.fromJson(response.data);
      } else {
        throw response.data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
