import 'package:json_annotation/json_annotation.dart';

part 'user_reg.g.dart';

@JsonSerializable()
class   UserReg {

  int userId;
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String emergencyMobileNumber;
  bool isActive;
  bool isDelete;


  UserReg({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.emergencyMobileNumber,
    this.isActive,
    this.isDelete,
  });


  factory UserReg.fromJson(Map<String, dynamic> json) => _$UserRegFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegToJson(this);

}