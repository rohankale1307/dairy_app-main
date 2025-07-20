import 'package:json_annotation/json_annotation.dart';

part 'milk_collection_model.g.dart';

@JsonSerializable()
class MilkCollectionModel {
  Header? header;
  List<Body>? body;

  MilkCollectionModel({this.header, this.body});
  factory MilkCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$MilkCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MilkCollectionModelToJson(this);
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
  String? labelName;
  List<Collections>? collections;

  Body({this.labelName, this.collections});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

@JsonSerializable()
class Collections {
  int? id;
  String? collectionShift;
  String? milkType;
  String? collectionDate;
  String? customerCode;
  String? customerName;
  String? collectionLtr;
  String? collectionFat;
  String? collectionSnf;
  String? collectionRate;
  String? collectionAmt;
  String? collectionTime;
  String? createdAt;
  String? updatedAt;

  Collections(
      {this.id,
      this.collectionShift,
      this.milkType,
      this.collectionDate,
      this.customerCode,
      this.customerName,
      this.collectionLtr,
      this.collectionFat,
      this.collectionSnf,
      this.collectionRate,
      this.collectionAmt,
      this.collectionTime,
      this.createdAt,
      this.updatedAt});

  factory Collections.fromJson(Map<String, dynamic> json) =>
      _$CollectionsFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsToJson(this);
}
