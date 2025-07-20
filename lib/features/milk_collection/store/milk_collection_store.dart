import 'package:dairy_app/features/milk_collection/model/add_new_collection/add_new_collection_request.dart';
import 'package:dairy_app/features/milk_collection/model/milk_collection_model.dart';
import 'package:mobx/mobx.dart';

import '../api/add_new_collection_api.dart';
import '../api/milk_collection_api.dart';
import '../model/add_new_collection/add_new_collection_response.dart';

part 'milk_collection_store.g.dart';

class MilkCollectionStore = MilkCollectionStoreBase with _$MilkCollectionStore;

abstract class MilkCollectionStoreBase with Store {
  @observable
  MilkCollectionModel? getMilkCollection;

  @observable
  NewCollectionResponseBody? newCollectionResponseBody;

  @action
  Future getMilkCollectionData({
    required MilkCollectionApi api,
  }) async {
    try {
      getMilkCollection = await api.fetchMilkCollectionData();
      return getMilkCollection;
    } catch (e) {
      rethrow;
    }

    // await api.fetchMilkCollectionData().then((final value) {
    //   if (value != null) {
    //     if (value.header!.status!.toLowerCase().contains('success')) {

    //       return getMilkCollection = ObservableFuture.value(value);

    //     } else {
    //       return getMilkCollection = ObservableFuture.error(value);
    //     }
    //   }
    // });
  }

  @action
  Future getNewCollectionData({
    required AddNewCollectionApi api,
  }) async {
    try {
      newCollectionResponseBody = await api.addNewMilkCollection(body: AddNewCollectionRequestBody(
        collectionDate: '20 July 2025',
        collectionFat: '3.7',
        collectionLtr: '30',
        collectionRate: '36',
        collectionShift: 'Evening',
        collectionSnf: '2.5',
        customerCode: '140',
        customerName: 'Sunil',
        milkType: 'Cow'
      ));
      return newCollectionResponseBody;
    } catch (e) {
      rethrow;
    }
  }
}
