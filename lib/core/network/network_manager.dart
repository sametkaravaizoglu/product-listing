// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_product_test/app/ui/global_widgets/loading_widget.dart';
import 'package:flutter_product_test/core/base/model/base_model.dart';
import 'package:flutter_product_test/core/constants/app_constants.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    initManager();
  }

  initManager() async {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: ApplicationConstants.instance.baseURL,
      headers: {
        "Charset": "utf-8",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    _dio = Dio(baseOptions);

    if (kDebugMode) {
      _dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseData: true,
          ),
        ),
      );
    }
  }

  late Dio _dio;

  Dio get dio => _dio;

  Future get<T extends IBaseModel>({
    required String path,
    required T model,
    Map<String, dynamic>? queryParameters,
    BuildContext? context,
  }) async {
    dynamic responseData;
    try {
      if (context != null) {
        Loader.show(context, progressIndicator: const LoadingOverlayWidget());
      }
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      responseData = _jsonBodyParser<T>(model, response.data);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        if (Loader.isShown) {
          Loader.hide();
        }
      }
    }
    return responseData;
  }

  Future post<T extends IBaseModel>({
    required String path,
    required T model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    BuildContext? context,
    Options? options,
  }) async {
    dynamic responseData;
    try {
      if (context != null) {
        Loader.show(context, progressIndicator: const LoadingOverlayWidget());
      }
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
      );
      responseData = _jsonBodyParser<T>(model, response.data);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        if (Loader.isShown) {
          Loader.hide();
        }
      }
    }
    return responseData;
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, dynamic jsonBody) async {
    try {
      if (jsonBody is List) {
        return jsonBody.map((e) => model.fromJson(e)).toList().cast<T>();
      } else if (jsonBody is Map) {
        return model.fromJson(jsonBody);
      } else {
        return jsonBody;
      }
    } catch (ex) {
      return jsonBody;
    }
  }
}
