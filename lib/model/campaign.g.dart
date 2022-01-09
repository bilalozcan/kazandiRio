// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      detailImageUrl: json['detailImageUrl'] as String?,
      adjustToken: json['adjustToken'],
      isLocationSpecific: json['isLocationSpecific'] as bool?,
      campaignType: json['campaignType'] as int?,
      locationLabel: json['locationLabel'],
      homePageOrder: json['homePageOrder'] as int?,
      campaignStartDate: json['campaignStartDate'] == null
          ? null
          : DateTime.parse(json['campaignStartDate'] as String),
      campaignEndDate: json['campaignEndDate'] == null
          ? null
          : DateTime.parse(json['campaignEndDate'] as String),
      descriptionHeader: json['descriptionHeader'] as String?,
      descriptionBody: json['descriptionBody'] as String?,
      isMapVisible: json['isMapVisible'] as bool?,
    );

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'detailImageUrl': instance.detailImageUrl,
      'adjustToken': instance.adjustToken,
      'isLocationSpecific': instance.isLocationSpecific,
      'campaignType': instance.campaignType,
      'locationLabel': instance.locationLabel,
      'homePageOrder': instance.homePageOrder,
      'campaignStartDate': instance.campaignStartDate?.toIso8601String(),
      'campaignEndDate': instance.campaignEndDate?.toIso8601String(),
      'descriptionHeader': instance.descriptionHeader,
      'descriptionBody': instance.descriptionBody,
      'isMapVisible': instance.isMapVisible,
    };
