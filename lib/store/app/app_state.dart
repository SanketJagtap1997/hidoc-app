import 'package:flutter/material.dart';
import 'package:hidoc/store/article/state.dart';
import 'package:hidoc/store/loader/state.dart';

@immutable
class AppState {
  final LoaderState loaderState;

  final ArticleState articleState;

  const AppState({
    required this.loaderState,
    required this.articleState,
  });

  factory AppState.initial() {
    return AppState(
      loaderState: LoaderState.initial(),
      articleState: ArticleState.initial(),
    );
  }

  AppState copyWith({
    LoaderState? loaderState,
    ArticleState? articleState,
  }) {
    return AppState(
      loaderState: loaderState ?? this.loaderState,
      articleState: articleState ?? this.articleState,
    );
  }
}
