// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gain _$GainFromJson(Map<String, dynamic> json) => Gain(
      id: json['id'] as String?,
      code: json['code'] as String?,
      isUsed: json['isUsed'] as bool?,
      isCustomRedeem: json['isCustomRedeem'] as bool?,
      generatorUserId: json['generatorUserId'] as String?,
      redeemUserId: json['redeemUserId'] as String?,
      usedDate: json['usedDate'] == null
          ? null
          : DateTime.parse(json['usedDate'] as String),
      usedCampaignId: json['usedCampaignId'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      v: json['v'] as int?,
      gainId: json['gainId'] as String?,
      gift: json['gift'] == null
          ? null
          : Gift.fromJson(json['gift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GainToJson(Gain instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'isUsed': instance.isUsed,
      'isCustomRedeem': instance.isCustomRedeem,
      'generatorUserId': instance.generatorUserId,
      'redeemUserId': instance.redeemUserId,
      'usedDate': instance.usedDate?.toIso8601String(),
      'usedCampaignId': instance.usedCampaignId,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'v': instance.v,
      'gainId': instance.gainId,
      'gift': instance.gift,
    };

Gift _$GiftFromJson(Map<String, dynamic> json) => Gift(
      isSuccess: json['isSuccess'] as bool?,
      benefitName: json['benefitName'] as String?,
      campaignName: json['campaignName'] as String?,
      benefitImageUrl: json['benefitImageUrl'] as String?,
    );

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'benefitName': instance.benefitName,
      'campaignName': instance.campaignName,
      'benefitImageUrl': instance.benefitImageUrl,
    };
