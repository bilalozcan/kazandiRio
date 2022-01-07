// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      header: json['header'] == null
          ? null
          : BaseResponseHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: json['body'],
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };
