import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hidoc/common/styles/color_pallet.dart';
import 'package:hidoc/repository/article/provider.dart';
import 'package:hidoc/repository/article/repository.dart';
import 'package:hidoc/store/app/app_reducer.dart';
import 'package:hidoc/store/app/app_state.dart';
import 'package:hidoc/ui/screens/article/article_main_screen.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware /*, LoggingMiddleware.printer()*/],
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MultiProvider(
        providers: [
          Provider<ArticleRepository>.value(value: ArticleRepository(ArticleApiProvider())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HIDOC',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            scaffoldBackgroundColor: ColorPalette.white,
          ),
          home: const ArticleScreen(),
        ),
      ),
    );
  }
}
