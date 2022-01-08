import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

part 'campaign.g.dart';

@JsonSerializable()
class Campaign extends BaseModel{
  Campaign({
    this.id,
    this.name,
    this.imageUrl,
    this.detailImageUrl,
    this.adjustToken,
    this.isLocationSpecific,
    this.campaignType,
    this.locationLabel,
    this.homePageOrder,
    this.campaignStartDate,
    this.campaignEndDate,
  });

  String? id;
  String? name;
  String? imageUrl;
  String? detailImageUrl;
  dynamic adjustToken;
  bool? isLocationSpecific;
  int? campaignType;
  dynamic locationLabel;
  int? homePageOrder;
  DateTime? campaignStartDate;
  DateTime? campaignEndDate;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
