import 'package:json_annotation/json_annotation.dart';

part 'favourite_adrs.g.dart';

@JsonSerializable()
class FavouriteAdrs{
  int userId;
  String favoriteType;
  String favoriteAddress;

  FavouriteAdrs({this.userId, this.favoriteType,this.favoriteAddress,});

  factory FavouriteAdrs.fromJson(Map<String, dynamic> json) => _$FavouriteAdrsFromJson(json);
  Map<String, dynamic> toJson() => _$FavouriteAdrsToJson(this);

}