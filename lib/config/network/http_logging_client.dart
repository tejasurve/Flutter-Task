/*
 * Created on Sat Nov 02 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpLoggingClient extends http.BaseClient {
  final http.Client _client;
  final Logger _logger;

  HttpLoggingClient(this._client) : _logger = Logger();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Log request details
    _logger.i('Request: ${request.method} ${request.url}');
    _logger.i('Headers: ${request.headers}');

    if (request is http.Request && request.body.isNotEmpty) {
      try {
        _logger.i('Request Body: ${jsonDecode(request.body)}');
      } catch (_) {
        _logger.i('Request Body: ${request.body}');
      }
    }

    final response = await _client.send(request);

    // Capture response body for logging
    final responseBody = await response.stream.bytesToString();
    _logger.i('Response: ${response.statusCode} ${response.reasonPhrase}');
    _logger.i('Response Headers: ${response.headers}');

    try {
      _logger.i('Response Body: ${jsonDecode(responseBody)}');
    } catch (_) {
      _logger.i('Response Body: $responseBody');
    }

    return http.StreamedResponse(
      Stream.fromIterable([utf8.encode(responseBody)]),
      response.statusCode,
      reasonPhrase: response.reasonPhrase,
      headers: response.headers,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
    );
  }
}
