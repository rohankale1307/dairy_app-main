// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milk_collection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MilkCollectionStore on MilkCollectionStoreBase, Store {
  late final _$getMilkCollectionAtom =
      Atom(name: 'MilkCollectionStoreBase.getMilkCollection', context: context);

  @override
  MilkCollectionModel? get getMilkCollection {
    _$getMilkCollectionAtom.reportRead();
    return super.getMilkCollection;
  }

  @override
  set getMilkCollection(MilkCollectionModel? value) {
    _$getMilkCollectionAtom.reportWrite(value, super.getMilkCollection, () {
      super.getMilkCollection = value;
    });
  }

  late final _$newCollectionResponseBodyAtom = Atom(
      name: 'MilkCollectionStoreBase.newCollectionResponseBody',
      context: context);

  @override
  NewCollectionResponseBody? get newCollectionResponseBody {
    _$newCollectionResponseBodyAtom.reportRead();
    return super.newCollectionResponseBody;
  }

  @override
  set newCollectionResponseBody(NewCollectionResponseBody? value) {
    _$newCollectionResponseBodyAtom
        .reportWrite(value, super.newCollectionResponseBody, () {
      super.newCollectionResponseBody = value;
    });
  }

  late final _$getCustDetailsResponseAtom = Atom(
      name: 'MilkCollectionStoreBase.getCustDetailsResponse', context: context);

  @override
  GetCustDetailsResponse? get getCustDetailsResponse {
    _$getCustDetailsResponseAtom.reportRead();
    return super.getCustDetailsResponse;
  }

  @override
  set getCustDetailsResponse(GetCustDetailsResponse? value) {
    _$getCustDetailsResponseAtom
        .reportWrite(value, super.getCustDetailsResponse, () {
      super.getCustDetailsResponse = value;
    });
  }

  late final _$customerNameAtom =
      Atom(name: 'MilkCollectionStoreBase.customerName', context: context);

  @override
  String get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  late final _$getMilkCollectionDataAsyncAction = AsyncAction(
      'MilkCollectionStoreBase.getMilkCollectionData',
      context: context);

  @override
  Future<dynamic> getMilkCollectionData({required MilkCollectionApi api}) {
    return _$getMilkCollectionDataAsyncAction
        .run(() => super.getMilkCollectionData(api: api));
  }

  late final _$getNewCollectionDataAsyncAction = AsyncAction(
      'MilkCollectionStoreBase.getNewCollectionData',
      context: context);

  @override
  Future<dynamic> getNewCollectionData({required AddNewCollectionApi api}) {
    return _$getNewCollectionDataAsyncAction
        .run(() => super.getNewCollectionData(api: api));
  }

  late final _$getCustDetailsAsyncAction =
      AsyncAction('MilkCollectionStoreBase.getCustDetails', context: context);

  @override
  Future<dynamic> getCustDetails(
      {required GetCustDtlsApi api, required String code}) {
    return _$getCustDetailsAsyncAction
        .run(() => super.getCustDetails(api: api, code: code));
  }

  @override
  String toString() {
    return '''
getMilkCollection: ${getMilkCollection},
newCollectionResponseBody: ${newCollectionResponseBody},
getCustDetailsResponse: ${getCustDetailsResponse},
customerName: ${customerName}
    ''';
  }
}
