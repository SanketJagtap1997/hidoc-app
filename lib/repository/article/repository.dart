import 'package:hidoc/models/article_model.dart';

import 'provider.dart';

class ArticleRepository {
  final ArticleApiProvider _articleApiProvider;

  ArticleRepository(this._articleApiProvider);

  ArticleApiProvider get articalApiProvider => _articleApiProvider;

  Future<ArticleDataResponse> getArticleData() async {
    return await _articleApiProvider.getArticleData();
  }
}
