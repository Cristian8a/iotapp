import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// peso desde la respuesta JSON
double parseWeigth(String responseBody) {
  final parsed = jsonDecode(responseBody);
  final results = parsed['results'];
  final firstResult = results[0];
  final value = firstResult['value'];
  return value.toDouble();
}

// obtener peso
Future<double> fetchWeigth() async {
  Uri liga = Uri.parse(
      'https://stem.ubidots.com/app/devices/v1.6/devices/sensoresDevice/peso/values/?token=BBUS-WpbIkBZKfIIAbi9JgsCZXzQ5k6Zny1');
  final response = await http.get(liga);
  if (response.statusCode == 200) {
    return parseWeigth(response.body);
  } else {
    throw Exception('Failed to fetch weigth');
  }
}

Future<double> fetchGas() async {
  Uri liga = Uri.parse(
      'https://stem.ubidots.com/app/devices/v1.6/devices/sensoresDevice/caja/values/?token=BBUS-WpbIkBZKfIIAbi9JgsCZXzQ5k6Zny1');
  final response = await http.get(liga);
  if (response.statusCode == 200) {
    return parseWeigth(response.body);
  } else {
    throw Exception('Failed to fetch proximity');
  }
}
