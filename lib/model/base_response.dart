import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

import 'base_response_header.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel{
  BaseResponse({
    this.header,
    this.body,
  });

  BaseResponseHeader? header;
  Object? body;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  BaseResponse fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}


