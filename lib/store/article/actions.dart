import 'dart:async';

import 'package:hidoc/models/article_model.dart';
import 'package:hidoc/repository/article/repository.dart';
import 'package:hidoc/store/app/app_state.dart';
import 'package:hidoc/store/loader/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:provider/provider.dart';

abstract class SessionAction {
  @override
  String toString() {
    return '$runtimeType';
  }
}

class LoadArticleData extends SessionAction {
  final ArticleModel data;

  LoadArticleData({required this.data});
}

ThunkAction<AppState> getArticleDataAction(
  context,
) {
  final articleRepository = Provider.of<ArticleRepository>(context, listen: false);
  return (Store<AppState> store) async {
    store.dispatch(LoaderLoadingStart());
    final articleResponse = await articleRepository.getArticleData();
    store.dispatch(LoaderLoadingFinish());

    if (articleResponse.error != null) {
      // completer.completeError(articleResponse.error?.description ?? "");

      // store.dispatch(ErrorOccured(error: sessionResponse.error!));
      return;
    }
    store.dispatch(LoadArticleData(data: articleResponse.data!));
    // completer.complete();
  };
}
