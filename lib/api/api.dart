import 'dart:convert';
import 'dart:io';

import 'package:have_you_ordered_app/model/key_value_pair.dart';
import 'package:have_you_ordered_app/model/ordered_list.dart';

class OrderedApi {
  static Future<OrderedList> getOrderedList(String date) async {
    return OrderedList.fromJson(
        await _Request._request(path: '/api/ordered/$date'));
  }
}

class DashboardApi {
  static Future<List<KeyValuePair>> getOrderedTimes() async {
    List list = await _Request._request(path: '/api/dashboard/agg-by-day');
    return list.map((each) => KeyValuePair.fromJson(each)).toList();
  }

  static Future<List<KeyValuePair>> getOrderedPersons() async {
    List list =
        await _Request._request(path: '/api/dashboard/agg-order-person');
    return list.map((each) => KeyValuePair.fromJson(each)).toList();
  }
}

class _Request {
  static const String _scheme = 'https';
  static const String _host = 'yz.wwj.icu';

  static Future<dynamic> _request(
      {scheme: _scheme, host: _host, String path}) async {
    HttpClient httpClient = HttpClient();
    Uri uri = Uri(scheme: scheme, host: host, path: path);
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    httpClient.close();
    return json.decode(responseBody);
  }
}
