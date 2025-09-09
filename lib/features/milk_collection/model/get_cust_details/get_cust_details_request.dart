import 'package:json_annotation/json_annotation.dart';

part 'get_cust_details_request.g.dart';

@JsonSerializable()
class GetCustDetailsRequest {
  GetCustDetailsRequestBody? body;

  GetCustDetailsRequest({this.body});
  factory GetCustDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetCustDetailsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetCustDetailsRequestToJson(this);
}

@JsonSerializable()
class GetCustDetailsRequestBody {
  String code;

  GetCustDetailsRequestBody({
    required this.code,
  });

  factory GetCustDetailsRequestBody.fromJson(Map<String, dynamic> json) =>
      _$GetCustDetailsRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetCustDetailsRequestBodyToJson(this);
}
