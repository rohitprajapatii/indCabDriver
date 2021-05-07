import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse {

  String msg;
  int statusCode;


  DefaultResponse({
    this.msg,
    this.statusCode,

  });
  factory DefaultResponse.fromJson(Map<String, dynamic> json) => _$DefaultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);

}