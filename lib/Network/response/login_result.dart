import 'package:json_annotation/json_annotation.dart';

part 'login_result.g.dart';

@JsonSerializable()
class LoginResult {


  int driverId;
  String driverName ;
  String driverJoiningDate;
  String driverEmail;
  String driverContactNo;
  String driverFatherName;
  String driverMotherName;


  LoginResult({this.driverId,
      this.driverName,
      this.driverJoiningDate,
      this.driverEmail,
      this.driverContactNo,
      this.driverFatherName,
      this.driverMotherName});


  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResultToJson(this);

}




