import 'package:flutter/material.dart';
import 'package:music_player_app/noticias/widgets/lista_noticias.dart';
import 'package:music_player_app/service/news_service.dart';
import 'package:provider/provider.dart';

class Tabs1Page extends StatefulWidget {
  static const String routeName = '/tabs1';

  const Tabs1Page({Key? key}) : super(key: key);

  @override
  State<Tabs1Page> createState() => _Tabs1PageState();
}
// with AutomaticKeepAliveClientMixin sirve para que no destruya el widget cuando pasa de una pantalla a otra y seguis viendo desde donde estaba.
class _Tabs1PageState extends State<Tabs1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      // se podría hacer así tambien (headlines.length == 0)
        body:(headlines.isEmpty)
        ? const Center(
          child: CircularProgressIndicator(color: Colors.red,),
        )
        :  Container(
           decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.2,
                        0.5,
                        10
                      ],
                      colors: [
                        (Color(0xffc6eff9)),
                       (Color(0xff64c3ed)),
                       (Color.fromARGB(255, 86, 139, 170)),
                      ]),
                 
                ),
          child: ListaNoticias(
      noticias: headlines,
    ),
        )
        );
  }
  
  @override
  
  bool get wantKeepAlive => true;
}


