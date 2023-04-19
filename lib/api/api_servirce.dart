import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> post(Uri link, Map data) async {
    var response = await http
        .post(link,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('Time out');
    });
    return response;
  }
}
