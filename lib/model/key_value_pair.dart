import 'package:json_annotation/json_annotation.dart';

part 'key_value_pair.g.dart';

@JsonSerializable()
class KeyValuePair {
  final String key;
  final int value;

  KeyValuePair(this.key, this.value);

  factory KeyValuePair.fromJson(Map<String, dynamic> json) =>
      _$KeyValuePairFromJson(json);

  Map<String, dynamic> toJson() => _$KeyValuePairToJson(this);

  @override
  String toString() {
    return 'KeyValuePair{key: $key, value: $value}';
  }
}
