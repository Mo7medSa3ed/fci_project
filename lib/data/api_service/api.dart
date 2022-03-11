import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fci_project/config.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';

class ApiServices {
  static Dio? _dio;
  static ApiServices? _apiServices;

  static ApiServices? getInstance() {
    return _apiServices ??= ApiServices();
  }

  ApiServices() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options = BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        sendTimeout: timeOutDuration,
        receiveDataWhenStatusError: true,
        connectTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        validateStatus: (status) => status! < 500,
      );
    }
  }

  _handleError(error, {required msg, required url, bool showAlert = false}) {
    if (showAlert) Nav.pop();
    late String message;
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.cancel:
          message = serverNotResponsedErrorMsg + ' $timeOutDuration';
          break;
        case DioErrorType.response:
          message = msg;
          break;
        case DioErrorType.other:
          message = generalErrorMsg;
          break;
        default:
          message = generalErrorMsg;
          break;
      }
    } else if (error is SocketException) {
      message = generalErrorMsg;
    } else if (error is TimeoutException) {
      message = serverNotResponsedErrorMsg + ' $timeOutDuration';
    } else {
      message = generalErrorMsg;
    }
    if (showAlert) Alert.showErrorDialog(desc: message);
    return throw Error();
  }

  _processResponse({required Response response, msg, bool showAlert = false}) {
    if (showAlert) Nav.pop();
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      default:
        if (showAlert) Alert.showErrorDialog(desc: msg ?? generalErrorMsg);
        return throw Error();
    }
  }

  String checkKeyContain(json) {
    if (json is Map<String, dynamic>) {
      return json.containsKey('msg') ? json['msg'].toString() : validateError;
    }
    return '';
  }

  Future get({required String url, String? id, bool showAlert = false}) async {
    if (showAlert) Alert.showLoading();

    late Response response;
    try {
      if (id != null) url += '/$id';
      if (url.contains('?')) {
        url += '&&storeName=$storeName';
      } else {
        url += '?storeName=$storeName';
      }
      print('$baseUrl$url');
      response = await _dio!.get('$baseUrl$url',
          options: Options(headers: {"x-auth-token": tok}));
      print(response.data);

      return _processResponse(
          response: response,
          msg: checkKeyContain(response.data),
          showAlert: showAlert);
    } catch (error) {
      print(error);
      return _handleError(error,
          msg: checkKeyContain(response.data),
          showAlert: showAlert,
          url: response.requestOptions.path);
    }
  }

  Future post(
      {required url,
      String? id,
      required Map<String, dynamic>? data,
      bool showAlert = false}) async {
    if (showAlert) Alert.showLoading();
    late Response response;
    try {
      if (id != null) url += '/$id';
      if (url.contains('?')) {
        url += '&&storeName=$storeName';
      } else {
        url += '?storeName=$storeName';
      }

      response = await _dio!.post('$baseUrl$url',
          data: data, options: Options(headers: {"x-auth-token": tok}));
      return _processResponse(
          response: response,
          msg: checkKeyContain(response.data),
          showAlert: showAlert);
    } catch (error) {
      return _handleError(error,
          showAlert: showAlert,
          msg: checkKeyContain(response.data),
          url: response.requestOptions.path);
    }
  }

  Future patch(
      {required url,
      String? id,
      bool showAlert = false,
      required Map<String, dynamic>? data}) async {
    if (showAlert) Alert.showLoading();
    late Response response;
    try {
      if (id != null) url += '/$id';
      if (url.contains('?')) {
        url += '&&storeName=$storeName';
      } else {
        url += '?storeName=$storeName';
      }

      response = await _dio!.patch('$baseUrl$url',
          data: data, options: Options(headers: {"x-auth-token": tok}));
      return _processResponse(
          response: response,
          msg: checkKeyContain(response.data),
          showAlert: showAlert);
    } catch (error) {
      return _handleError(error,
          msg: checkKeyContain(response.data),
          showAlert: showAlert,
          url: response.requestOptions.path);
    }
  }
}
