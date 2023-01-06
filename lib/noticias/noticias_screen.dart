import 'package:flutter/material.dart';
import 'package:music_player_app/noticias/tabs1_page.dart';
import 'package:music_player_app/noticias/widgets/tabs2_page.dart';
import 'package:provider/provider.dart';

class NoticiasScreen extends StatelessWidget {
  static const String routeName = '/noticias-screen';
  const NoticiasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: const Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar(
      
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.red,
      backgroundColor: (const Color.fromARGB(255, 86, 139, 170)),
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'For you', ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.public,
            ),
            label: 'Headers', ),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [

        Tabs1Page(),

       
        Tab2Page()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  final PageController _pageController =  PageController();

  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOutBack);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
