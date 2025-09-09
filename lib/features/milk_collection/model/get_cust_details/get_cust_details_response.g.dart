// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cust_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustDetailsResponse _$GetCustDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustDetailsResponse(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustDetailsResponseToJson(
        GetCustDetailsResponse instance) =>
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
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      customerName: json['customerName'] as String?,
      customerNickName: json['customerNickName'] as String?,
      joiningDate: json['joiningDate'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'customerName': instance.customerName,
      'customerNickName': instance.customerNickName,
      'joiningDate': instance.joiningDate,
      'phoneNumber': instance.phoneNumber,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
