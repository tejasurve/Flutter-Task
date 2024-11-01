/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

class ResponseResult {
  bool? success;
  String? message;
  dynamic data;
  int statusCode;
  String? error;
  String? errorCode;

  ResponseResult(
      {this.success,
      this.message,
      this.data,
      required this.statusCode,
      this.error,
      this.errorCode});

  bool get isSuccess => success ?? false;

  ResponseResult.withError(
      {required this.statusCode,
      required this.error,
      this.message,
      required this.errorCode,
      this.data});

  factory ResponseResult.fromJson(Map<String, dynamic> json) => ResponseResult(
        statusCode: int.tryParse(json["statusCode"].toString()) ?? 0,
        error: json["error"],
        success: json["success"] == "true",
        message: json["message"],
        data: json["data"],
        errorCode: json["errorCode"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode.toString(),
        "error": error,
        "success": success.toString(),
        "message": message,
        "data": data,
        "errorCode": errorCode
      };
}
