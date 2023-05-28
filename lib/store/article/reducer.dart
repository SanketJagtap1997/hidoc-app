import 'package:hidoc/store/article/actions.dart';
import 'package:hidoc/store/article/state.dart';
import 'package:redux/redux.dart';

Reducer<ArticleState> articleStateReducer = combineReducers<ArticleState>([
  TypedReducer<ArticleState, LoadArticleData>(_load_article_data),
]);
ArticleState _load_article_data(ArticleState articleState, LoadArticleData action) {
  return articleState.copyWith(articleData: action.data.articalData);
}
