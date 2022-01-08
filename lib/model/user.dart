import 'package:json_annotation/json_annotation.dart';
import 'package:kazandirio/core/base/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel {
  User({
    this.id,
    this.consumerNumber,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
    this.birthDate,
    this.createdOn,
  });

  String? id;
  int? consumerNumber;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  String? phoneNumber;
  dynamic address;
  dynamic birthDate;
  DateTime? createdOn;

  String get fullName => 'Test User';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
