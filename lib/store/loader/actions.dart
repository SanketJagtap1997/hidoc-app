


abstract class LoaderAction {
  @override
  String toString() {
    return '$runtimeType';
  }
}

class LoaderLoadingStart extends LoaderAction {}

class LoaderLoadingFinish extends LoaderAction {}

class LoaderSavingStart extends LoaderAction {}

class LoaderSavingFinish extends LoaderAction {}

