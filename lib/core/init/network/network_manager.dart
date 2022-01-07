import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kazandirio/core/constant/app/app_constants.dart';
import 'package:kazandirio/core/constant/enum/locale_enum.dart';
import 'package:kazandirio/core/extension/locale_extension.dart';
import '/core/init/cache/locale_manager.dart';
import '../../base/base_model.dart';
import '../../../model/base_response.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance != null) return _instance;
    _instance = NetworkManager.init();
    return _instance;
  }

  late final Dio dio;
  late final Dio dioFile;

  NetworkManager.init() {
    print(LocaleManager.instance.getStringValue(Locale.TOKEN.value));
    dio = Dio(BaseOptions(
        baseUrl: ApplicationConstants.BASE_URL,
        contentType: 'application/json',
        headers: {
          if (LocaleManager.instance.containsKey(Locale.TOKEN.value)!)
            'Authorization':
                'Bearer ${LocaleManager.instance.getStringValue(Locale.TOKEN.value)}'
        }));
    dioFile = Dio(BaseOptions(
        baseUrl: ApplicationConstants.BASE_URL,
        contentType: 'multipart/form-data',
        headers: {
          if (LocaleManager.instance.containsKey(Locale.TOKEN.value)!)
            'Authorization':
                'Bearer ${LocaleManager.instance.getStringValue(Locale.TOKEN.value)}'
        }));
  }

  void updateToken(String token) =>
      dio.options.headers = {'Authorization': 'Bearer $token'};

  Future post<T extends BaseModel>(String path, dynamic data, T model,
      {Map<String, dynamic>? queryParameters,
      bool isBaseResponse = true,
      isFile = false}) async {
    try {
      var body = data is Map || data is FormData ? data : data.toJson();
      var response;

      if (isFile) {
        response = await dioFile.post(path,
            data: body, queryParameters: queryParameters);
      } else {
        response =
            await dio.post(path, data: body, queryParameters: queryParameters);
      }
      if (response.statusCode == HttpStatus.ok) {
        if (isBaseResponse) {
          return _baserResponseConverter(response.data, model: model);
        } else {
          return model.fromJson(response.data);
        }
      } else {
        log('$path POST FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        await Fluttertoast.showToast(
            msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
        return null;
      }
    } on DioError catch (dioError) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path POST ERROR | Error Type: ${dioError.error} | Error Message: ${dioError.message}');
      return null;
    } catch (error) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path POST ERROR | Error : $error');
      return null;
    }
  }

  Future get<T extends BaseModel>(String path, T model,
      {Map<String, dynamic>? queryParameters,
      bool isBaseResponse = true}) async {
    try {
      final response =
          await dio.get(path, queryParameters: queryParameters ?? {});
      if (response.statusCode == HttpStatus.ok) {
        if (isBaseResponse) {
          return _baserResponseConverter(response.data, model: model);
        } else {
          if (response.data is List) {
            var list = <T>[];
            (response.data as List)
                .forEach((element) => list.add(model.fromJson(element)));
            return list;
          } else {
            return model.fromJson(response.data);
          }
        }
      } else {
        log('$path GET FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        await Fluttertoast.showToast(
            msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
        return null;
      }
    } on DioError catch (dioError) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path GET ERROR | Error Type: ${dioError.error} | Error Message: ${dioError.message}');
      return null;
    } catch (error) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path GET ERROR | Error : $error');
      return null;
    }
  }

  Future put<T extends BaseModel>(String path, dynamic data, T model,
      {Map<String, dynamic>? queryParameters,
      bool isBaseResponse = true,
      isFile = false}) async {
    try {
      var body = data is Map || data is FormData ? data : data.toJson();
      var response;
      if (isFile) {
        response = await dioFile.post(path,
            data: body, queryParameters: queryParameters);
      } else {
        response =
            await dio.put(path, data: body, queryParameters: queryParameters);
      }
      if (response.statusCode == HttpStatus.ok) {
        if (isBaseResponse) {
          return _baserResponseConverter(response.data, model: model);
        } else {
          return model.fromJson(response.data);
        }
      } else {
        log('$path PUT FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        await Fluttertoast.showToast(
            msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
        return null;
      }
    } on DioError catch (dioError) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path PUT ERROR | Error Type: ${dioError.error} | Error Message: ${dioError.message}');
      return null;
    } catch (error) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path PUT ERROR | Error : $error');
      return null;
    }
  }

  dynamic _baserResponseConverter<T extends BaseModel>(dynamic data,
      {T? model}) {
    final baseResponse = BaseResponse.fromJson(data);
    if (baseResponse.header!.isSuccess!) {
      if (baseResponse.body != null) {
        if (baseResponse.body is List) {
          var list = <T>[];
          (baseResponse.body as List)
              .forEach((element) => list.add(model!.fromJson(element)));
          return list;
        } else {
          return model!.fromJson(baseResponse.body as Map<String, dynamic>);
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

/* if (baseResponse.data is List) {
        var list = [];
        baseResponse.data != null
            ? (baseResponse.data as List)
                .map((value) => list.add(model!.fromJson(value)))
                .toList()
            : null;
        return list;
      } else {
        return baseResponse.data != null
            ? model != null
                ? model.fromJson((baseResponse.data! as Map<String, dynamic>))
                : baseResponse
            : baseResponse;
      }*/
