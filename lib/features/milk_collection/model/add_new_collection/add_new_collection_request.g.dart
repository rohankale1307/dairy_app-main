// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_collection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewCollectionRequest _$AddNewCollectionRequestFromJson(
        Map<String, dynamic> json) =>
    AddNewCollectionRequest(
      body: json['body'] == null
          ? null
          : AddNewCollectionRequestBody.fromJson(
              json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddNewCollectionRequestToJson(
        AddNewCollectionRequest instance) =>
    <String, dynamic>{
      'body': instance.body,
    };

AddNewCollectionRequestBody _$AddNewCollectionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddNewCollectionRequestBody(
      collectionDate: json['collectionDate'] as String?,
      collectionFat: json['collectionFat'] as String?,
      collectionLtr: json['collectionLtr'] as String?,
      collectionRate: json['collectionRate'] as String?,
      collectionShift: json['collectionShift'] as String?,
      collectionSnf: json['collectionSnf'] as String?,
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String?,
      milkType: json['milkType'] as String?,
    );

Map<String, dynamic> _$AddNewCollectionRequestBodyToJson(
        AddNewCollectionRequestBody instance) =>
    <String, dynamic>{
      'collectionShift': instance.collectionShift,
      'milkType': instance.milkType,
      'collectionDate': instance.collectionDate,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'collectionLtr': instance.collectionLtr,
      'collectionFat': instance.collectionFat,
      'collectionSnf': instance.collectionSnf,
      'collectionRate': instance.collectionRate,
    };
