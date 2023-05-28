import 'package:hidoc/store/article/reducer.dart';
import 'package:hidoc/store/loader/reducer.dart';

import 'app_state.dart';

AppState appStateReducer(AppState state, dynamic action) => AppState(
      loaderState: loaderStateReducer(state.loaderState, action),
      articleState: articleStateReducer(state.articleState, action),
    );
