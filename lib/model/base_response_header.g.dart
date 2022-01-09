// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseHeader _$BaseResponseHeaderFromJson(Map<String, dynamic> json) =>
    BaseResponseHeader(
      isSuccess: json['isSuccess'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseHeaderToJson(BaseResponseHeader instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
