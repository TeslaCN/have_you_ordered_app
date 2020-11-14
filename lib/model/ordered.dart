import 'package:json_annotation/json_annotation.dart';

part 'ordered.g.dart';

@JsonSerializable()
class Ordered {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String orderType;
  final String time;
  final int isAM;
  final String YYMMDD;
  final String suggestContent;
  @JsonKey(name: '__v')
  final int v;

  Ordered(this.id, this.name, this.orderType, this.time, this.isAM, this.YYMMDD,
      this.suggestContent, this.v);

  factory Ordered.fromJson(Map<String, dynamic> json) =>
      _$OrderedFromJson(json);

  Map<String, dynamic> toJson() => _$OrderedToJson(this);

  @override
  String toString() {
    return 'Ordered{id: $id, name: $name, orderType: $orderType, time: $time, isAM: $isAM, YYMMDD: $YYMMDD, suggestContent: $suggestContent, v: $v}';
  }
}
