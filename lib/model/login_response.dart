import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseModel {
  LoginResponse({this.isValid});

  bool? isValid;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
