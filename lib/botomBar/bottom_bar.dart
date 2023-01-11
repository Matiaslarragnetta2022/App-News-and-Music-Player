import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player_app/water%20flow/water.dart';
import '../Sliders/slideshow_page.dart';
import '../home/home.dart';
import '../noticias/noticias_screen.dart';
import '../music/music_player.dart';
import '../variables/global_variables.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavBarWidth = 42;
  double bottomNavBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const MusicPlayerScreen(),
    const NoticiasScreen(),
    const WaterFlowAnimation(),
    const SlideshowPage(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userCartLength = Provider.of<UserProvider>(context).user.cart.length;
    // final userCartLength = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
      
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: const Color(0xff61BBFE),
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // first (HOME PAGE)
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomNavBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(FontAwesomeIcons.houseChimneyCrack),
            ),
            label: '',
          ),
          // second (catalogo PAGE)
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomNavBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(FontAwesomeIcons.arrowsSpin),
            ),
            label: '',
          ),
          // three (wallet PAGE)
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomNavBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(FontAwesomeIcons.newspaper),
            ),
            label: '',
          ),

          // second (PROFILE PAGE)
          BottomNavigationBarItem(
            icon: Container(
                width: bottomNavBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 3
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(FontAwesomeIcons.landmark)),
            label: '',
          ),

          // third (CART PAGE)
          BottomNavigationBarItem(
            icon: Container(
                width: bottomNavBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 4
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(FontAwesomeIcons.radiation)),
            label: '',
          ),
        ],
      ),
    );
  }
}
