import 'package:json_annotation/json_annotation.dart';

part 'add_new_collection_request.g.dart';

@JsonSerializable()
class AddNewCollectionRequest {
  AddNewCollectionRequestBody? body;

  AddNewCollectionRequest({this.body});
  factory AddNewCollectionRequest.fromJson(Map<String, dynamic> json) =>
      _$AddNewCollectionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddNewCollectionRequestToJson(this);
}

@JsonSerializable()
class AddNewCollectionRequestBody {
  String? collectionShift;
  String? milkType;
  String? collectionDate;
  String? customerCode;
  String? customerName;
  String? collectionLtr;
  String? collectionFat;
  String? collectionSnf;
  String? collectionRate;

  AddNewCollectionRequestBody({
    this.collectionDate,
    this.collectionFat,
    this.collectionLtr,
    this.collectionRate,
    this.collectionShift,
    this.collectionSnf,
    this.customerCode,
    this.customerName,
    this.milkType,
  });

  factory AddNewCollectionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddNewCollectionRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddNewCollectionRequestBodyToJson(this);
}
