import 'package:flutter/material.dart';
import 'package:kazandirio/view/authenticate/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/provider/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(MultiProvider(providers: [...ApplicationProvider.instance!.dependItems], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KazandıRio',
      debugShowCheckedModeBanner: false,
      // theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: SplashView(),
    );
  }
}