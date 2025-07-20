// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCollectionResponseBody _$NewCollectionResponseBodyFromJson(
        Map<String, dynamic> json) =>
    NewCollectionResponseBody(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewCollectionResponseBodyToJson(
        NewCollectionResponseBody instance) =>
    <String, dynamic>{
      'header': instance.header,
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
