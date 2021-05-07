// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWallet _$AddWalletFromJson(Map<String, dynamic> json) {
  return AddWallet(
    userId: json['userId'] as int,
    orderId: json['orderId'] as int,
    amount: json['amount'] as String,
    paymentType: json['paymentType'] as String,
    isSuccess: json['isSuccess'] as bool,
  );
}

Map<String, dynamic> _$AddWalletToJson(AddWallet instance) => <String, dynamic>{
      'userId': instance.userId,
      'orderId': instance.orderId,
      'amount': instance.amount,
      'paymentType': instance.paymentType,
      'isSuccess': instance.isSuccess,
    };
