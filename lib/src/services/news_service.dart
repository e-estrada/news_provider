import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/src/models/models.dart';

class NewsServices extends ChangeNotifier {
  final String _baseUrl = 'newsapi.org';
  final String _apiKey = 'aaea2efb33844e1e9693f48af9384e86';
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];


  NewsServices() {
    getTopHeadlines();
  }

  Future<String> _getJsonData(String endpoint, [String country = 'mx']) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'apiKey': _apiKey,
      'country': country,
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getTopHeadlines() async {
    final jsonData = await _getJsonData('/v2/top-headlines');
    final newsResponse = newsResponseFromJson(jsonData);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
