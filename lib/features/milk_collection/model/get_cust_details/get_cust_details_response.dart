import 'package:json_annotation/json_annotation.dart';

part 'get_cust_details_response.g.dart';

@JsonSerializable()
class GetCustDetailsResponse {
  Header? header;
  Body? body;

  GetCustDetailsResponse({this.header, this.body});

  factory GetCustDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCustDetailsResponseToJson(this);
}

@JsonSerializable()
class Header {
  String? status;
  int? responseCode;
  String? message;

  Header({this.status, this.responseCode, this.message});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable()
class Body {
  int? id;
  String? code;
  String? customerName;
  String? customerNickName;
  String? joiningDate;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Body(
      {this.id,
      this.code,
      this.customerName,
      this.customerNickName,
      this.joiningDate,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}
