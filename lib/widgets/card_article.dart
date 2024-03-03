import 'package:dicoding_news_app/data/models/article.dart';
import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Hero(
          tag: article.urlToImage ?? '',
          child: Image.network(
            article.urlToImage ?? '',
            width: 100,
          ),
        ),
        title: Text(article.title ?? ''),
        subtitle: Text(
          article.author ?? '',
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: article,
          );
        },
      ),
    );
  }
}
