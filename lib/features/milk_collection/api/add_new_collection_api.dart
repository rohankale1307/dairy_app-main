import 'package:dio/dio.dart';

import '../model/add_new_collection/add_new_collection_request.dart';
import '../model/add_new_collection/add_new_collection_response.dart';

class AddNewCollectionApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dairyapp.codeclause.com/public/api',
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer YOUR_TOKEN', // Uncomment if needed
      },
    ),
  );

  Future<NewCollectionResponseBody> addNewMilkCollection(
      {required AddNewCollectionRequestBody body}) async {
    try {
      final response = await _dio.post(
        '/manageCollections',
        data: body.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Milk collection submitted successfully!');
        print('Response: ${response.data}');
        return NewCollectionResponseBody.fromJson(response.data);
      } else {
        print('Failed to submit. Status Code: ${response.statusCode}');
        return NewCollectionResponseBody();
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

// class AddNewCollectionApi {
//   final Dio _dio = Dio();
//   AddNewCollectionApi();

//   Future<NewCollectionResponseBody?> addNewMilkCollection(
//       {required AddNewCollectionRequestBody body}) async {
//     try {
//       final response = await _dio.post(
//         'https://dairyapp.codeclause.com/public/api/getDailyCollections',
//         data: {
//           "collectionShift": "Morning",
//           "milkType": "Cow",
//           "collectionDate": "09 Jul 2025",
//           "customerCode": "101",
//           "customerName": "Suraj Chavan",
//           "collectionLtr": "10",
//           "collectionFat": "3.5",
//           "collectionSnf": "8.5",
//           "collectionRate": "35"
//         },
//         options: Options(contentType: 'application/json'),
//       );

//       // Process successful response
//       if (response.data.isNotEmpty) {
//         return NewCollectionResponseBody.fromJson(response.data);
//       } else {
//         throw response.data['message'];
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
