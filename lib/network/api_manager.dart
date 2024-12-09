import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:oak_haven_massage_app/utils/constants.dart';

import '../models/network_response.dart';
import '../utils/storage.dart';
import '../utils/toast.dart';
import 'network_config.dart';

Dio dio = Dio();

enum ApiType { get, post, put, delete }

class ApiManager {
  Future get(String endpoint) async {
    try {
      log("Requesting to: $endpoint");
      dynamic response = await dio.get(endpoint);
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }

  ApiManager() {
    dio.options
      ..baseUrl = AppNetworkConfig.apiBaseURL
      ..validateStatus = (int? status) {
        return status! > 0;
      }
      ..headers = {'Accept': 'application/json', 'content-type': 'application/json'};
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) {
          if (kDebugMode) {
            print("interceptors onError : ${e.toString()}");
          }
          return handler.next(e);
        },
      ),
    );
  }

  // ignore: missing_return
  Future<APIResponse> call(String apiName, body, type) async {
    APIResponse apiData = APIResponse(message: 'No Data', data: null);
    try {
      dynamic authToken = await getStorage(Constants.token);
      if (authToken != null && authToken != '') {
        dio.options.headers["Authorization"] = "Bearer $authToken";
      }

      dynamic response;
      if (kDebugMode) {
        print("Bearer AuthToken...${dio.options.headers["Authorization"]}");
        print("Request...$body");
        print("Api...${AppNetworkConfig.apiBaseURL}$apiName");
      }
      switch (type) {
        case ApiType.post:
          response = await dio.post(apiName, data: body);
          break;
        case ApiType.delete:
          response = await dio.delete(apiName, data: body);
          break;
        case ApiType.put:
          response = await dio.put(apiName, data: body);
          break;
      }
      log("Response...$response");
      apiData = await _checkStatus(response, apiName, body);
      return apiData;
    } on DioException catch (e) {
      apiData.success = false;
      apiData.message = e.message ?? "Something went wrong!";
      errorToast(apiData.message);
      return apiData;
    } on SocketException catch (e) {
      apiData.success = false;
      apiData.message = e.message;
      errorToast(apiData.message);
      return apiData;
    } on Exception catch (e) {
      apiData.success = false;
      apiData.message = e.toString();
      errorToast(apiData.message);
      return apiData;
    }
  }

  Future<APIResponse> _checkStatus(response, apiName, req) async {
    return APIResponse(
      success: response.data['success'],
      message: response.data['message'],
      data: response.data['data'],
    );
  }
}