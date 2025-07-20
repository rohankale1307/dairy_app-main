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

  late final _$getMilkCollectionDataAsyncAction = AsyncAction(
      'MilkCollectionStoreBase.getMilkCollectionData',
      context: context);

  @override
  Future<dynamic> getMilkCollectionData({required MilkCollectionApi api}) {
    return _$getMilkCollectionDataAsyncAction
        .run(() => super.getMilkCollectionData(api: api));
  }

  @override
  String toString() {
    return '''
getMilkCollection: ${getMilkCollection}
    ''';
  }
}
