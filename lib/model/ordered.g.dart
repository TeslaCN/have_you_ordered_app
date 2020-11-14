// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ordered _$OrderedFromJson(Map<String, dynamic> json) {
  return Ordered(
    json['_id'] as String,
    json['name'] as String,
    json['orderType'] as String,
    json['time'] as String,
    json['isAM'] as int,
    json['YYMMDD'] as String,
    json['suggestContent'] as String,
    json['__v'] as int,
  );
}

Map<String, dynamic> _$OrderedToJson(Ordered instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'orderType': instance.orderType,
      'time': instance.time,
      'isAM': instance.isAM,
      'YYMMDD': instance.YYMMDD,
      'suggestContent': instance.suggestContent,
      '__v': instance.v,
    };
