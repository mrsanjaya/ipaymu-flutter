
import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'models/direct_payment_model.dart';
import 'models/payment_method_model.dart';

final dio = Dio();
class Ipaymu {
  static const MethodChannel _channel = MethodChannel('ipaymu');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  String? notifyUrl;
  String apiKey;
  String vaNumber;
  String sandboxUrl = "sandbox.ipaymu.com";
  String prodUrl = "my.ipaymu.com";
  bool sandbox;
  Ipaymu({required this.vaNumber, required this.apiKey, this.notifyUrl, this.sandbox = false});

  String toSign(HTTPMETHOD, requestBody){
    var bytes = utf8.encode(requestBody);
    var sha = sha256.convert(bytes);
    return "${HTTPMETHOD}:${vaNumber}:${sha.toString().toLowerCase()}:${apiKey}";
  }

  String signature(HTTPMETHOD, requestBody){
    var sign = toSign(HTTPMETHOD, requestBody);
    var key = utf8.encode(sign);
    var api = utf8.encode(apiKey);
    var hmac = new Hmac(sha256, api);

    var digest = hmac.convert(key);
    return digest.toString();
  }

  Future<paymentMethodModel> getPaymentList() async {
    var date = new DateTime.now();
    var timestamp = "${date.year}${date.month}${date.day}${date.hour}${date.minute}${date.second}";

    dio.options.headers['signature'] = signature("GET", jsonEncode({}));
    dio.options.headers['va'] = vaNumber;
    dio.options.headers['timestamp'] = timestamp;
    final response = await dio.get('https://${ sandbox ? sandboxUrl : prodUrl }/api/v2/payment-method-list');
    return paymentMethodModel.fromJson(response.data);
  }

  Future<directPaymentModel> directPayment(body) async {
    var date = new DateTime.now();
    var timestamp = "${date.year}${date.month}${date.day}${date.hour}${date.minute}${date.second}";

    var data = FormData.fromMap(body);
    print(data);
    dio.options.headers['signature'] = signature("POST", jsonEncode(body));
    dio.options.headers['va'] = vaNumber;
    dio.options.headers['timestamp'] = timestamp;
    final response = await dio.post('https://${ sandbox ? sandboxUrl : prodUrl }/api/v2/payment/direct', data: data);
    return directPaymentModel.fromJson(response.data);
  }
}
