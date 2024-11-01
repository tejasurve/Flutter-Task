/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter_task/config/network/api_service.dart';
import 'package:flutter_task/data/models/content.dart';
import 'package:flutter_task/resources/constants/endpoints.dart';
import 'package:flutter_task/resources/utils/response.dart';
import 'package:flutter_task/service_locator/service_locator.dart';
import 'package:http/http.dart';

class FailedToContentData implements Exception {}

class ContentRepository {
  ApiService apiServices = serviceLocator<ApiService>();

  Future<List<Content>> getContentData() async {
    try {
      Map<String, dynamic> response = await apiServices.get(
        endPoint: Endpoints.getContentData,
      );
      ResponseResult result = ResponseResult.fromJson(response);
      return (result.data['data'] as List<dynamic>)
        .map((item) => Content.fromJson(item as Map<String, dynamic>))
        .toList();
    } catch (e) {
      throw FailedToContentData();
    }
  }
}
