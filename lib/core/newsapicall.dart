import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:my_app/model/newsapi.dart';
import './static.dart';

class NewsApiCall {
  Future<NewsApi?> getnewsdata(String topic) async {
    try {
      var url = Uri.https(StaticValue.baseURL, StaticValue.path, {
        'q': topic,
        'from': '2025-10-24',
        'apiKey': StaticValue.apiKey,
      });

      var response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Cache-Control': 'no-cache, private, no-store',
        },
      );

      if (response.statusCode.toString().contains("20")) {
        var jsondata = await convert.jsonDecode(response.body);
        var data = NewsApi.fromJson(jsondata);
        return data;
      }
      return null;
    } catch (e) {
      print('Error msg: ${e.toString()}');
      return null;
    }
  }
}
