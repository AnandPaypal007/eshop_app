import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eshop/Constant/constant.dart';
import 'package:eshop/Utils/user_session.dart';
import 'package:http/http.dart' as http;
import 'api_response.dart';
import 'app_exception.dart';
import 'string_constant.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class ApiBase {
  final String? url;
  ApiBase({this.url});

  Future<dynamic> get() async {
    print("URL:::: Get $url");
    final headers = _getHeaders();
    try {
      final response = await http.get(Uri.parse(url ?? ""), headers: headers);
      final ApiResponse responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ApiResponse> post(Object body) async {
    final headers = await _getHeaders();
    print("URL:::: Post $url");

    ApiResponse responseJson;
    try {
      final response = await http.post(Uri.parse(url ?? ""),
          body: json.encode(body), headers: headers);
      //appPrint("response:: ${response.body}");
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse> delete() async {
    final headers = await _getHeaders();

    ApiResponse responseJson;
    try {
      final response =
          await http.delete(Uri.parse(url ?? ""), headers: headers);
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse> patch(Map body) async {
    final headers = await _getHeaders();
    print("URL:::: Patch $url");

    ApiResponse responseJson;
    try {
      final response = await http.patch(Uri.parse(url ?? ""),
          body: json.encode(body), headers: headers);
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse> put(Map body) async {
    final headers = await _getHeaders();
    print("URL:::: Put $url");

    ApiResponse responseJson;
    try {
      final response = await http.put(Uri.parse(url ?? ""),
          body: json.encode(body), headers: headers);
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  ApiResponse _processResponse(http.Response response) {
    ApiResponse apiResponse = ApiResponse.error(response.body.toString());
    switch (response.statusCode) {
      case HttpStatus.created:
      case HttpStatus.ok:
        final data = response.body.isNotEmpty
            ? json.decode(utf8.decode(response.bodyBytes))
            : "";

        apiResponse = ApiResponse.complete(data);
        if (data.containsKey("message") && data["message"] != null)
          apiResponse.message = data["message"];
        break;
      case HttpStatus.badRequest:
        return _getError(response);
      //throw BadRequestException(response.body.toString());

      case HttpStatus.unauthorized:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.forbidden:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.notFound:
        apiResponse = ApiResponse.error(StringConstants.notFound,
            statusCode: response.statusCode);
        break;

      case HttpStatus.internalServerError:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.serviceUnavailable:
        throw UnauthorisedException(StringConstants.serviceUnavailable);

      default:
        final data = response.body.isNotEmpty ? json.decode(response.body) : "";
        String? message;

        if (data.containsKey("detail")) {
          if (data["detail"] is List) {
            message = data["detail"].first["msg"];
          } else {
            message = data["detail"];
          }
        }
        apiResponse = ApiResponse.error(message ?? "Something went wrong");
      //appPrint("error: $data");
    }
    return apiResponse;
  }

  _getError(response) {
    final data = response.body != null && response.body.length > 0
        ? json.decode(response.body)
        : "";
    String? message;
    if (data.containsKey("detail")) {
      message = data["detail"];
    }
    return ApiResponse.error(message ?? "Something went wrong");
  }

  _getHeaders() {
    String? os;

    if (kIsWeb) {
    } else {
      os = Platform.isAndroid ? "Android" : "iOS";
    }

    final String? token = UserSession.shared.token;
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",      
    };
    if (token != null && token.isNotEmpty) {
      headers["Authorization"] = 'Bearer $token';
    }
    return headers;
  }
}

class APIServiceManager extends ApiBase {
  APIServiceManager(serviceUrl) : super(url: AppUrls.baseUrl + serviceUrl);
}
