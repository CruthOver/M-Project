import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_const.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/meta/meta_model.dart';
import 'package:management_project/data/remotes/exception/app_exception.dart';

class BaseServices extends GetConnect {
  final Map<String, String> _headers = {};
  final Duration _timeout = const Duration(seconds: 10);
  BaseServices() {
    baseUrl = App.baseUrl;
    _headers['Authorization'] =
        'Bearer ${App.userToken}'; //191|YZsNrAYWeLol0RQRKRDDohDcEFDtcztOJy3mgzye12e9b374
    httpClient.timeout = _timeout;
  }

  Future<BaseResponseModel> getData(String endPoint, {Map<String, dynamic>? query}) async {
    Response response = await get(
      endPoint,
      query: query,
      headers: _headers,
    );
    debugPrint("Response $_headers");
    try {
      debugPrint("Response ${response.bodyString}");
      debugPrint("URL Request ${response.request!.url}");

      return _handleResponse(response);
    } catch (e) {
      debugPrint("[Error] ${e.toString()}");
      return BaseResponseModel(
        data: null,
        success: false,
        meta: MetaModel(status: e.toString(), statusCode: response.statusCode),
      );
    }
  }

  Future<BaseResponseModel> deleteData(String endPoint) async {
    Response response = await delete(
      endPoint,
      headers: _headers,
    );
    debugPrint("Response ${response.bodyString}");
    debugPrint("URL Request ${response.request!.url}");
    debugPrint("URL Request ${response.request!.headers}");
    return _handleResponse(response);
  }

  Future<BaseResponseModel> postData(String endPoint, Map<String, dynamic> data,
      {bool isFormData = false, bool isExistFile = false}) async {
    final dynamic data_;
    String contentType = httpClient.defaultContentType;
    if (isFormData) {
      contentType = 'multipart/form-data';
      data_ = FormData(data);
    } else {
      data_ = json.encode(data);
    }

    debugPrint("Request data : $data_");

    Response response = await post(
      endPoint,
      data_,
      contentType: contentType,
      headers: _headers,
    );

    debugPrint("URL Request ${response.request!.method} ==> ${response.request!.url}");
    debugPrint("Request Token : ${response.request!.headers['Authorization']}");

    debugPrint("Response : ${response.bodyString}");
    try {
      return _handleResponse(response);
    } catch (e) {
      debugPrint("Sini juga?");
      return BaseResponseModel(
        data: null,
        success: false,
        meta: response.body['meta'],
      );
    }
  }

  BaseResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200) {
      debugPrint("Response Boyd : ${response.body['data']}");
      debugPrint("Sini kan?");
      return BaseResponseModel(
          data: response.body['data'],
          meta: response.body.containsKey('meta')
              ? MetaModel.fromJson(response.body['meta'])
              : MetaModel(),
          success: true);
    } else {
      debugPrint("Masuk Else :${response.statusCode}");
      String message = AppException.errorMessage(response);
      MetaModel metaModel = MetaModel(status: message, statusCode: response.statusCode);
      if (response.body != null) {
        return BaseResponseModel(data: response.body, meta: metaModel, success: false);
      }
      return BaseResponseModel(data: null, meta: metaModel, success: false);
    }
  }
}
