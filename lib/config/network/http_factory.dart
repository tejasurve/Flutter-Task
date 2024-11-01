/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

/*
 * Created by Ahmad Manaa on Thu Jul 25 2024
 */

/*
 * Created by Ahmad Manaa on Thu Jul 25 2024
 */

import 'dart:io';
import 'package:flutter_task/config/network/network_config.dart';
import 'package:flutter_task/service_locator/service_locator.dart';
import 'package:http/http.dart' as http;

class HttpFactory {
  http.Client getClient() {
    final client = http.Client();
    // Customize the client if needed
    return client;
  }

  Map<String, String> getHeaders() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json, text/plain, */*',
      HttpHeaders.contentLanguageHeader: serviceLocator<NetworkConfig>().headerLanguage,
    };
  }
}

