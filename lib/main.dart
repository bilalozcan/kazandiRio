import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazandirio/view/authenticate/splash/splash_view.dart';
import 'package:kazandirio/view/event/evet_view.dart';
import 'package:provider/provider.dart';
import 'core/init/provider/provider_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [...ApplicationProvider.instance!.dependItems], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  Firebase.initializeApp(),
        builder: (context,sn){
      return sn.hasData?MaterialApp(
        title: 'KazandıRio',
        debugShowCheckedModeBanner: false,
        // theme: Provider.of<ThemeNotifier>(context).currentTheme,
        home: EventView(),
      ):MaterialApp(
        title: 'KazandıRio',
        debugShowCheckedModeBanner: false,
        // theme: Provider.of<ThemeNotifier>(context).currentTheme,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Color(0xff0C2D83),
            ),
          ),
        ),
      );
    });
  }
}