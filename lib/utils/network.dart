import 'package:butter/common/global.dart';
import 'package:butter/models/butter.dart';
import 'package:butter/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

class ButterHttpUtils {
  static final BaseOptions baseOptions = BaseOptions(
    connectTimeout: CONNECTION_TIMEOUT,
  );
  static final dio = Dio(baseOptions);

  static String generateButtersByUserIdUrl(String url) {
    return p.join(ROOT_API_URL, BUTTERS_BY_USER_URL, url);
  }

  static String generateButtersByAllUrl(String url) {
    return p.join(ROOT_API_URL, BUTTERS_ALL_URL, url);
  }

  static String generateCommentsByButterIdUrl(String url) {
    return p.join(ROOT_API_URL, COMMENTS_BY_BUTTER_ID_URL, url);
  }

  static String generateCommentPostUrl() {
    return p.join(ROOT_API_URL, COMMENT_URL);
  }

  static String generateMediaItemUrl(String url) {
    return p.join(ROOT_API_URL, IMAGE_URL, url);
  }

  static String generateUserUrl(String url) {
    return p.join(ROOT_API_URL, USER_URL, url);
  }
  
  static String generateAvatarUrl(String url) {
    return p.join(ROOT_API_URL, AVATAR_URL, url);
  }

  static String generateAvatarByUserIdUrl(String url) {
    return p.join(ROOT_API_URL, AVATAR_BY_USER_ID_URL, url);
  }

  static String generateLoginUrl() {
    return p.join(ROOT_API_URL, LOGIN_URL);
  }

  static Map<String, String> getJwtHeader() {
    return {
      "Authorization": "Bearer " + Global.token
    };
  }

  static Future request(String url,
    {String method = "GET", data, Map<String, dynamic>? params, Map<String, dynamic>? headers}) async {
    Options options = Options(
      method: method,
      headers: headers,
    );
    try {
      final future = await dio.request(url, data: data, queryParameters: params, options: options);
      return future;
    } on DioError catch(err) {
      throw err;
    }
  }
}