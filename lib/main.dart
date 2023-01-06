import 'package:flutter/material.dart';
import 'package:music_player_app/Providers/scan_list_provider.dart';
import 'package:music_player_app/Providers/ui_provider.dart';
import 'package:music_player_app/botomBar/bottom_bar.dart';
import 'package:music_player_app/routes.dart';
import 'package:music_player_app/service/news_service.dart';
import 'package:provider/provider.dart';

import 'music/model/audio_player_model.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AudioPlayerModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        ),
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanListProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      //routes: AppRoutes.getAppRoutes(),
      title: 'Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple
        )
      ),
      home: const BottomBar(),
    );
  }
}
