import 'package:have_you_ordered_app/model/ordered.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ordered_list.g.dart';

@JsonSerializable()
class OrderedList {
  @JsonKey(name: 'error_code')
  final int errorCode;
  final String msg;
  final List<Ordered> data;

  OrderedList(this.errorCode, this.msg, this.data);

  factory OrderedList.fromJson(Map<String, dynamic> json) =>
      _$OrderedListFromJson(json);

  Map<String, dynamic> toJson() => _$OrderedListToJson(this);

  @override
  String toString() {
    return 'OrderedList{errorCode: $errorCode, msg: $msg, data: $data}';
  }
}
