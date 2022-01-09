// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateResponse _$ValidateResponseFromJson(Map<String, dynamic> json) =>
    ValidateResponse(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      isFirstLogin: json['isFirstLogin'] as bool?,
      id: json['id'] as String?,
      isDeleteRequested: json['isDeleteRequested'] as bool?,
      isBasicInfoProvided: json['isBasicInfoProvided'] as bool?,
      registeredDate: json['registeredDate'] == null
          ? null
          : DateTime.parse(json['registeredDate'] as String),
    );

Map<String, dynamic> _$ValidateResponseToJson(ValidateResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'isFirstLogin': instance.isFirstLogin,
      'id': instance.id,
      'isDeleteRequested': instance.isDeleteRequested,
      'isBasicInfoProvided': instance.isBasicInfoProvided,
      'registeredDate': instance.registeredDate?.toIso8601String(),
    };
