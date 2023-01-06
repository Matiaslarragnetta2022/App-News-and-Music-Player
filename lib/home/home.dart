import 'package:flutter/material.dart';
import 'package:music_player_app/custom%20Drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
    static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const Drawer(child: CustomDrawer(),
      ),
      appBar: AppBar(),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
