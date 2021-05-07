import 'package:json_annotation/json_annotation.dart';

part 'user_address.g.dart';

@JsonSerializable()
class UserAddress {

  int favouriteId;
  int userId;
  String favoriteType;
  String favoriteAddress;
  String createdDate;


  UserAddress({this.favouriteId, this.userId, this.favoriteType, this.favoriteAddress, this.createdDate});

  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

}



