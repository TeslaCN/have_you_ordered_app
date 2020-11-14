// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedList _$OrderedListFromJson(Map<String, dynamic> json) {
  return OrderedList(
    json['error_code'] as int,
    json['msg'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Ordered.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderedListToJson(OrderedList instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'msg': instance.msg,
      'data': instance.data,
    };
