import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/theme/tema.dart';
import 'package:news_provider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headlines = Provider.of<NewsServices>(context).headlines;
    // newsService.headlines;
    return Scaffold(
      body: (headlines.isEmpty)
        ? Center(
            child: CircularProgressIndicator(color: miTema.colorScheme.secondary)
          )
        : ListaNoticias(noticias: headlines),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
