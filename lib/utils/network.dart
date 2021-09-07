import 'package:butter/models/butter.dart';
import 'package:butter/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

class ButterHttpUtils {
  static final BaseOptions baseOptions = BaseOptions(
    connectTimeout: CONNECTION_TIMEOUT,
  );
  static final dio = Dio(baseOptions);

  static String generateMediaItemUrl(String url) {
    return p.join(IMAGE_URL, url);
  }

  static String generateUserUrl(String url) {
    return p.join(USER_URL, url);
  }
  
  static String generateAvatarUrl(String url) {
    return p.join(AVATAR_URL, url);
  }

  static Future request(String url,
    {String method = "GET", Map<String, dynamic>? params}) async {
    Options options = Options(method: method);
    try {
      final future = await dio.request(url, queryParameters: params, options: options);
      return future;
    } on DioError catch(err) {
      throw err;
    }
  }
}