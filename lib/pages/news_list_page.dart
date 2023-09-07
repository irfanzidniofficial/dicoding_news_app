import 'package:dicoding_news_app/models/articles_model.dart';
import 'package:dicoding_news_app/pages/detail_page.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: article);
    },
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8.0,
    ),
    leading: Image.network(
      article.urlToImage,
      width: 100,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(
            Icons.error,
          ),
        );
      },
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
  );
}
