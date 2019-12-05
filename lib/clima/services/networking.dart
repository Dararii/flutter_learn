import 'dart:convert';

import 'package:http/http.dart';

class NetworkEngine {
  Future getData(String url) async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "";
    }
  }
}
