import 'package:flutter/material.dart';
import 'package:music_player_app/QR/mapa_page.dart';
import 'package:music_player_app/noticias/noticias_screen.dart';
import 'package:music_player_app/noticias/tabs1_page.dart';

import 'QR/qr_screen.dart';
import 'botomBar/bottom_bar.dart';
import 'home/home.dart';
import 'noticias/widgets/tabs2_page.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
       case NoticiasScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NoticiasScreen(),
      );
         case Tabs1Page.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Tabs1Page(),
      );
            case Tab2Page.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Tab2Page(),
      );
             case QrScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const QrScreen(),
      );
      case MapaPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  MapaPage(),
      );
   
   

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
