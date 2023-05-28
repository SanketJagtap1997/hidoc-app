import 'package:meta/meta.dart';


@immutable
class LoaderState {
  final bool isLoading;
  final bool isSaving;

  const LoaderState(
      {this.isLoading = false, this.isSaving = false});

  factory LoaderState.initial() {
    return const LoaderState(
      isLoading: false,
      isSaving: false,
    );
  }

  LoaderState copyWith({
    bool? isLoading,
    bool? isSaving,
  }) {
    return LoaderState(
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      isSaving.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoaderState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isSaving == other.isSaving;

  @override
  String toString() {
    return 'LoaderState{isLoading: $isLoading, isSaving: $isSaving}';
  }
}