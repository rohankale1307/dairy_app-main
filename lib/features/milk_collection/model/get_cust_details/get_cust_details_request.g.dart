// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cust_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustDetailsRequest _$GetCustDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    GetCustDetailsRequest(
      body: json['body'] == null
          ? null
          : GetCustDetailsRequestBody.fromJson(
              json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustDetailsRequestToJson(
        GetCustDetailsRequest instance) =>
    <String, dynamic>{
      'body': instance.body,
    };

GetCustDetailsRequestBody _$GetCustDetailsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetCustDetailsRequestBody(
      code: json['code'] as String,
    );

Map<String, dynamic> _$GetCustDetailsRequestBodyToJson(
        GetCustDetailsRequestBody instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
