import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hidoc/common/styles/color_pallet.dart';
import 'package:hidoc/store/app/app_state.dart';
import 'package:hidoc/store/article/actions.dart';
import 'package:hidoc/store/article/state.dart';
import 'package:hidoc/store/loader/state.dart';
import 'package:hidoc/ui/screens/article/header.dart';
import 'package:redux/redux.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ArticleViewModel>(
        distinct: true,
        onInit: (store) {},
        onInitialBuild: (vm) {
          vm.getArticleData();
        },
        onDidChange: (oldVm, vm) {
          print('onDidChange SelectBankPageState...');
        },
        converter: (store) => ArticleViewModel.fromStore(context, store),
        builder: (context, vm) {
          if (vm.loaderState.isLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: ColorPalette.robinBlue,
                ),
              ),
            );
          } else {
            if (vm.articleState.articleData?.article != null) {
              return SafeArea(child: Scaffold(body: ArticleHeader(vm: vm)));
            } else {
              return const Scaffold(body: Center(child: Text('No Data found')));
            }
          }
        });
  }
}

class ArticleViewModel {
  final ArticleState articleState;
  final LoaderState loaderState;
  final Function getArticleData;

  ArticleViewModel({
    required this.articleState,
    required this.getArticleData,
    required this.loaderState,
  });

  static ArticleViewModel fromStore(context, Store<AppState> store) {
    _loadArticleData() {
      store.dispatch(getArticleDataAction(context));
    }

    return ArticleViewModel(articleState: store.state.articleState, getArticleData: _loadArticleData, loaderState: store.state.loaderState);
  }
}
