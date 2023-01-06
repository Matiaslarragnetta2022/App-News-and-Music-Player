import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player_app/music/model/category_model.dart';
import 'package:music_player_app/music/model/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'a0592a237ec045399a55beaf727c67c1';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.football, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
    
    getArticlesByCategory(_selectedCategory);
  }

  bool get isLoading => _isLoading;

  get selectedCategory => _selectedCategory;
  set selectedCategory(dynamic valor) {
    _selectedCategory = valor;
    _isLoading = true;
    getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      categoryArticles[selectedCategory]!;

  getTopHeadlines() async {
    const url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(Uri.parse(url));
    final newResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return categoryArticles[category];
    }

    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category';
    final resp = await http.get(Uri.parse(url));
    final newResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]!.addAll(newResponse.articles);
_isLoading = false;
    notifyListeners();
  }
}
