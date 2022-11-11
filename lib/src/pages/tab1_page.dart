import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsServices>(context).headlines;
    // newsService.headlines;
    return Scaffold(
      body: ListaNoticias(noticias: newsService),
    );
  }
}
