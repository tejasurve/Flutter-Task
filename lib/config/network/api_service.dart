/*
 * Created on Fri Nov 01 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'dart:convert';
import 'package:flutter_task/config/network/http_factory.dart';
import 'package:flutter_task/config/network/network_config.dart';
import 'package:flutter_task/service_locator/service_locator.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client _client;
  final HttpFactory _httpFactory = HttpFactory();

  ApiService(this._client);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
   
    final uri = Uri.parse('${serviceLocator<NetworkConfig>().baseUrl}$endPoint').replace(queryParameters: params);
    final response = await _client.get(uri, headers: _httpFactory.getHeaders());
    return _decodeResponse(response);
  }

  Future<http.Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
   
    final uri = Uri.parse('${serviceLocator<NetworkConfig>().baseUrl}$endPoint');
    final response = await _client.post(
      uri,
      headers: _httpFactory.getHeaders(),
      body: jsonEncode(data),
    );
    return _checkResponseStatus(response);
  }

  Future<http.Response> put({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final uri = Uri.parse('${serviceLocator<NetworkConfig>().baseUrl}$endPoint');
    final response = await _client.put(
      uri,
      headers: _httpFactory.getHeaders(),
      body: jsonEncode(data),
    );
    return _checkResponseStatus(response);
  }

  Future<http.Response> patch({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final uri = Uri.parse('${serviceLocator<NetworkConfig>().baseUrl}$endPoint');
    final response = await _client.patch(
      uri,
      headers: _httpFactory.getHeaders(),
      body: jsonEncode(data),
    );
    return _checkResponseStatus(response);
  }

  Future<http.Response> delete({
    required String endPoint,
  }) async {
    final uri = Uri.parse('${serviceLocator<NetworkConfig>().baseUrl}$endPoint');
    final response = await _client.delete(uri, headers: _httpFactory.getHeaders());
    return _checkResponseStatus(response);
  }
  http.Response _checkResponseStatus(http.Response response) {
    
    return jsonDecode(response.body);
  }
}

  dynamic _decodeResponse(http.Response response) {
    
    return jsonDecode(response.body); // Parse response body to JSON
  }


