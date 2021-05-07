import 'package:json_annotation/json_annotation.dart';

part 'booking_his.g.dart';

@JsonSerializable()
class BookinHis {

  String createdDate;
  String tripType;
  String pickUpLocation;
  var payment;


  BookinHis({this.createdDate, this.tripType, this.pickUpLocation, this.payment,});

  factory BookinHis.fromJson(Map<String, dynamic> json) => _$BookinHisFromJson(json);
  Map<String, dynamic> toJson() => _$BookinHisToJson(this);

}




