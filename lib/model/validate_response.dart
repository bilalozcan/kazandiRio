import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

part 'validate_response.g.dart';

@JsonSerializable()
class ValidateResponse extends BaseModel {
  ValidateResponse({
    this.token,
    this.refreshToken,
    this.isFirstLogin,
    this.id,
    this.isDeleteRequested,
    this.isBasicInfoProvided,
    this.registeredDate,
  });

  String? token;
  String? refreshToken;
  bool? isFirstLogin;
  String? id;
  bool? isDeleteRequested;
  bool? isBasicInfoProvided;
  DateTime? registeredDate;

  factory ValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateResponseFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$ValidateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ValidateResponseToJson(this);
}
