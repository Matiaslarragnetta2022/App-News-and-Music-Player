import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player_app/music/model/news_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(
            noticia: noticias[index],
            index: index,
          );
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia, index: index,),


        _TarjetaTitulo(noticia: noticia), 

        _TarjetaImagen(noticia: noticia), 
        _TarjetaBody(noticia: noticia), 


        const _TarjetaBotones(),

        const SizedBox(height: 10,) , 
        const Divider(), 
      ],
    );
  }
}


class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(onPressed: (){}, 
        fillColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), 
        
        ),child: const Icon(FontAwesomeIcons.star,
        )
        ), 
const SizedBox(width: 10,), 
          RawMaterialButton(onPressed: (){}, 
        fillColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), 
        
        ),child: const Icon(Icons.more,
        )
        ), 
        ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;
  const _TarjetaBody({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      
      // ignore: unnecessary_null_comparison
      child: Text((noticia.description.toString() != null) ? noticia.description.toString() : "No Pictures"),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  
  final Article noticia;
  const _TarjetaImagen({ required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: Container(
          child: (noticia.urlToImage != null) 
          ?
          
          FadeInImage(placeholder: const AssetImage('assets/loading.gif'), image: NetworkImage(noticia.urlToImage.toString()
          )
          )
           : const Image(image: AssetImage('assets/no-image.jpg'))
        
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;
  const _TarjetaTitulo({ required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({
    Key? key,
    required this.noticia, required this.index,
  }) : super(key: key);

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: const TextStyle(color: Colors.red),), 
          Text('${noticia.source.name}. ',)
        ],
      ),
    );
  }
}
