import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class NewsServices extends ChangeNotifier {
  List<Article> headlines = [];
  NewsServices() {
    getTopHedlines();
  }

  getTopHedlines() {
    print('Cargando Hedlines');
  }
}
