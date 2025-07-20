// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milk_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MilkCollectionModel _$MilkCollectionModelFromJson(Map<String, dynamic> json) =>
    MilkCollectionModel(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Body.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MilkCollectionModelToJson(
        MilkCollectionModel instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      status: json['status'] as String?,
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'status': instance.status,
      'responseCode': instance.responseCode,
      'message': instance.message,
    };

Body _$BodyFromJson(Map<String, dynamic> json) => Body(
      labelName: json['labelName'] as String?,
      collections: (json['collections'] as List<dynamic>?)
          ?.map((e) => Collections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'labelName': instance.labelName,
      'collections': instance.collections,
    };

Collections _$CollectionsFromJson(Map<String, dynamic> json) => Collections(
      id: (json['id'] as num?)?.toInt(),
      collectionShift: json['collectionShift'] as String?,
      milkType: json['milkType'] as String?,
      collectionDate: json['collectionDate'] as String?,
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String?,
      collectionLtr: json['collectionLtr'] as String?,
      collectionFat: json['collectionFat'] as String?,
      collectionSnf: json['collectionSnf'] as String?,
      collectionRate: json['collectionRate'] as String?,
      collectionAmt: json['collectionAmt'] as String?,
      collectionTime: json['collectionTime'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CollectionsToJson(Collections instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionShift': instance.collectionShift,
      'milkType': instance.milkType,
      'collectionDate': instance.collectionDate,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'collectionLtr': instance.collectionLtr,
      'collectionFat': instance.collectionFat,
      'collectionSnf': instance.collectionSnf,
      'collectionRate': instance.collectionRate,
      'collectionAmt': instance.collectionAmt,
      'collectionTime': instance.collectionTime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
