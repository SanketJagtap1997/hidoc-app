import 'package:dio/dio.dart';
import 'package:hidoc/common/utils/app_errors.dart';
import 'package:hidoc/models/article_model.dart';
import 'package:hidoc/repository/url_provider.dart';

class ArticleApiProvider {
  Dio dio = Dio();
  Future<ArticleDataResponse> getArticleData() async {
    try {
      FormData formData = FormData.fromMap({'sId': "500", 'uuId': '', "userId": "423914"});
      final response = await dio.post(UrlProvider.getArticleData, data: formData, options: Options(contentType: Headers.formUrlEncodedContentType));
      return ArticleDataResponse.fromJson(response.data);
    } on DioError catch (e) {
      return ArticleDataResponse.withError(errorHandler(e));
    }
  }

  AppBaseError errorHandler(DioError error) {
    if (error.response?.statusCode == 403) {
      return NetworkError.invalidSession;
    }
    print(error);
    String code = error.response?.statusCode.toString() ?? 'Failed';
    String description = error.response?.statusMessage ?? "Something Went Wrong";
    return NetworkError.unknown(code, description, error.stackTrace);
  }
}
