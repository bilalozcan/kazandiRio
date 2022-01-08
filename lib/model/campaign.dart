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
    this.descriptionHeader,
    this.descriptionBody,
    this.isMapVisible
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
  String? descriptionHeader;
  String? descriptionBody;
  bool? isMapVisible;

  factory Campaign.fromJson(Map<String, dynamic> json) => _$CampaignFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$CampaignFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CampaignToJson(this);
}
