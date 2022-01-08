import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

part 'gain.g.dart';

@JsonSerializable()
class Gain extends BaseModel {
  Gain({
    this.id,
    this.code,
    this.isUsed,
    this.isCustomRedeem,
    this.generatorUserId,
    this.redeemUserId,
    this.usedDate,
    this.usedCampaignId,
    this.createDate,
    this.updateDate,
    this.v,
    this.gainId,
    this.gift,
  });

  String? id;
  String? code;
  bool? isUsed;
  bool? isCustomRedeem;
  String? generatorUserId;
  String? redeemUserId;
  DateTime? usedDate;
  String? usedCampaignId;
  DateTime? createDate;
  DateTime? updateDate;
  int? v;
  String? gainId;
  Gift? gift;

  factory Gain.fromJson(Map<String, dynamic> json) => _$GainFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$GainFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GainToJson(this);
}

@JsonSerializable()
class Gift extends BaseModel {
  Gift({
    this.isSuccess,
    this.benefitName,
    this.campaignName,
    this.benefitImageUrl,
  });

  bool? isSuccess;
  String? benefitName;
  String? campaignName;
  String? benefitImageUrl;

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GiftToJson(this);
}
