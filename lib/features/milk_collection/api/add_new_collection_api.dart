import 'package:dio/dio.dart';

import '../model/add_new_collection/add_new_collection_request.dart';
import '../model/add_new_collection/add_new_collection_response.dart';

class AddNewCollectionApi {
  final Dio _dio = Dio();
  AddNewCollectionApi();

  Future<NewCollectionResponseBody?> addNewMilkCollection(
      {required AddNewCollectionRequestBody body}) async {
    try {
      final response = await _dio.post(
        'https://dairyapp.codeclause.com/public/api/getDailyCollections',
        data: AddNewCollectionRequest(body: body),
      );

      // Process successful response
      if (response.data.isNotEmpty) {
        return NewCollectionResponseBody.fromJson(response.data);
      } else {
        throw response.data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
