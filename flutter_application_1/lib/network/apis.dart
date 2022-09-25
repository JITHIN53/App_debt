import 'dart:convert';

import 'package:flutter_application_1/models/page_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://finekube.com/";

  Future<PageResponsemodel> getDebtDetails(int? id) async {
    String url = "${baseUrl}interview/flutterTest.php?pageNo=$id";

    final http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PageResponsemodel.fromJson(json);
    } else {
      throw (e) {
        return null;
      };
    }
  }
}
