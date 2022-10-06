import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class APIConstants {
  static String baseUrl =
      "https://trackmytransactions-production.up.railway.app/api/";
}

class BaseApiServices {
  static Future<http.Response?> get(
    String path, {
    Map<String, String>? headers,
    int timeout = 20,
  }) async {
    try {
      final response = await http
          .get(
            Uri.parse(APIConstants.baseUrl + path),
          )
          .timeout(Duration(seconds: timeout));
      return response;
    } on TimeoutException {
      Fluttertoast.showToast(
        msg: 'Request Timeout',
        backgroundColor: Colors.red,
      );
    } catch (exception) {
      Fluttertoast.showToast(
        msg: exception.toString(),
        backgroundColor: Colors.red,
      );
    }
    return null;
  }
}
