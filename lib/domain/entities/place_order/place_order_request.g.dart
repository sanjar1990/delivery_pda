// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) =>
    PlaceOrderRequest(
      (json['orders'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['service_user_id'] as num?)?.toInt(),
      (json['locker_cell_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PlaceOrderRequestToJson(PlaceOrderRequest instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'service_user_id': instance.service_user_id,
      'locker_cell_id': instance.locker_cell_id,
    };
