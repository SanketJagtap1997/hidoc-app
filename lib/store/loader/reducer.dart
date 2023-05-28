import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

Reducer<LoaderState> loaderStateReducer = combineReducers<LoaderState>([
  TypedReducer<LoaderState, LoaderLoadingStart>(_start_loading),
  TypedReducer<LoaderState, LoaderLoadingFinish>(_finish_loading),
  TypedReducer<LoaderState, LoaderSavingStart>(_start_saving),
  TypedReducer<LoaderState, LoaderSavingFinish>(_finish_saving),
]);

LoaderState _start_loading(LoaderState LoaderState, LoaderLoadingStart action) {
  return LoaderState.copyWith(isLoading: true, isSaving: false);
}

LoaderState _finish_loading(LoaderState LoaderState, LoaderLoadingFinish action) {
  return LoaderState.copyWith(isLoading: false, isSaving: false);
}


LoaderState _start_saving(LoaderState LoaderState, LoaderSavingStart action) {
  return LoaderState.copyWith(isLoading: false, isSaving: true);
}

LoaderState _finish_saving(LoaderState LoaderState, LoaderSavingFinish action) {
  return LoaderState.copyWith(isLoading: false, isSaving: false);
}