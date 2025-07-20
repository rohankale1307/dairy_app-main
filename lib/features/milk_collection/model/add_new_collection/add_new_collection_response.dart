import 'package:json_annotation/json_annotation.dart';

part 'add_new_collection_response.g.dart';

@JsonSerializable()
class NewCollectionResponseBody {
  Header? header;

  NewCollectionResponseBody({this.header});
  factory NewCollectionResponseBody.fromJson(Map<String, dynamic> json) =>
      _$NewCollectionResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$NewCollectionResponseBodyToJson(this);
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
