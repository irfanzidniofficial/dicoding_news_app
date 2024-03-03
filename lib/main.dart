import 'package:dicoding_news_app/data/models/article.dart';
import 'package:dicoding_news_app/ui/article_list_page.dart';
import 'package:dicoding_news_app/ui/article_webview.dart';
import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(103, 58, 183, 1)),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: ArticleListPage.routeName,
      routes: {
        ArticleListPage.routeName: (context) => const ArticleListPage(),
        DetailPage.routeName: (context) => DetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
