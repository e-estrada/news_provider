import 'package:flutter/material.dart';
import 'package:news_provider/src/models/models.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/theme/tema.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: _ListaCategorias())],
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context).categories;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final categoryName = categories[index].name;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _CategoryButton(categoria: categories[index]),
              const SizedBox(height: 5),
              Text('${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
            ],
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton({required this.categoria});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsServices>(context);
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name) ? miTema.colorScheme.secondary : Colors.black54,
        ),
      ),
    );
  }
}
