import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

part 'base_response_header.g.dart';

@JsonSerializable()
class BaseResponseHeader extends BaseModel{
  BaseResponseHeader({
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  bool? isSuccess;
  int? statusCode;
  String? message;

  factory BaseResponseHeader.fromJson(Map<String, dynamic> json) => _$BaseResponseHeaderFromJson(json);

  @override
  BaseResponseHeader fromJson(Map<String, dynamic> json) => _$BaseResponseHeaderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseHeaderToJson(this);
}