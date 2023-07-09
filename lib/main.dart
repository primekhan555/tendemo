import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/presentation/views/main_screen.dart';
import 'package:tendemo/providers/watch_provider.dart';

import 'constants/lang_constants.dart';
import 'di/di.dart';
import 'navigation/navigator_key.dart';
import 'navigation/route_generator.dart';
import 'providers/home_provider.dart';
import 'resources/app_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.initDI();
  await AppLocal.instance.initStorage();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: WatchProvider()),
    ChangeNotifierProvider.value(value: HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Locale> locals = [];
    for (var language in LangConstants.languages) {
      locals.add(Locale(language.languageCode, language.countryCode));
    }
    return MaterialApp(
      title: 'Ten Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: MainScreen.routeName,
    );
  }
}
