import 'package:flutter/material.dart';
import 'package:music_player_app/music/model/category_model.dart';
import 'package:music_player_app/noticias/widgets/lista_noticias.dart';
import 'package:music_player_app/service/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  static const String routeName = '/tabs2';

  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold( 
          body: Container(
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
            child: Column(
        children: [
            
            _ListaCategorias(), 
   if ( !newsService.isLoading )
                Expanded(
                  child: ListaNoticias( noticias: newsService.getArticulosCategoriaSeleccionada, )
                ),

              if ( newsService.isLoading )
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                )
              )

            
            ],
      ),
          )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categories[index].name;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categories[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (() {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      
      }),
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffb0d9ff)),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name) 
          ? Colors.red
          
         : const Color.fromARGB(255, 88, 124, 232),
        ),
      ),
    );
  }
}
