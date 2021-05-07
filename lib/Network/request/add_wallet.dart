import 'package:json_annotation/json_annotation.dart';

part 'add_wallet.g.dart';

@JsonSerializable()
class AddWallet{
  int userId;
  int orderId;
  String amount;
  String paymentType;
  bool isSuccess;

  AddWallet({this.userId, this.orderId,this.amount, this.paymentType, this.isSuccess});

  factory AddWallet.fromJson(Map<String, dynamic> json) => _$AddWalletFromJson(json);
  Map<String, dynamic> toJson() => _$AddWalletToJson(this);

}