// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dicoding_news_app/common/navigation.dart';
import 'package:dicoding_news_app/ui/article_webview.dart';
import 'package:flutter/material.dart';

import 'package:dicoding_news_app/data/models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;
  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage ?? ''),
            Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.description ?? '',
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${article.publishedAt}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Author: ${article.author}"),
                  const Divider(color: Colors.grey),
                  Text(
                    article.content ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.content ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigation.intentWithData(
                            ArticleWebView.routeName, article.url);
                      },
                      child: const Text(
                        "Read More",
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
