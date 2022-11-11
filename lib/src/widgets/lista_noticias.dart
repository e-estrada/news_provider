import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({super.key, required this.noticias});
  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: noticias.length, itemBuilder: (context, index) => Text(noticias[index].title));
  }
}
