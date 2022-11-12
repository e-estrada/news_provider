import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/src/models/models.dart';

class NewsServices extends ChangeNotifier {
  final String _baseUrl = 'newsapi.org';
  final String _apiKey = 'aaea2efb33844e1e9693f48af9384e86';
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  Map<String, List<Article>> categoryArticles = {};

  NewsServices() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
    getArticlesByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, {String country = 'mx', String category = 'business'}) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'apiKey': _apiKey,
      'country': country,
      'category': category,
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  List<Article>? get getArticulosPorCategoria => categoryArticles[selectedCategory];

  getTopHeadlines() async {
    final jsonData = await _getJsonData('/v2/top-headlines');
    final newsResponse = newsResponseFromJson(jsonData);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final jsonData = await _getJsonData('/v2/top-headlines', category: category);
    final newsResponse = newsResponseFromJson(jsonData);
    categoryArticles[category]?.addAll(newsResponse.articles);
    notifyListeners();
  }
}
