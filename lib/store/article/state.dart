import 'package:hidoc/models/article_model.dart';
import 'package:meta/meta.dart';

@immutable
class ArticleState {
  final ArticalData? articleData;

  ArticleState({this.articleData});

  factory ArticleState.initial() {
    return ArticleState(articleData: ArticalData());
  }

  ArticleState copyWith({ArticalData? articleData}) {
    return ArticleState(
      articleData: articleData ?? this.articleData,
    );
  }

  @override
  int get hashCode => articleData.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ArticleState && runtimeType == other.runtimeType && articleData == other.articleData;

  @override
  String toString() {
    return 'ArticleState{data: $articleData}';
  }
}
