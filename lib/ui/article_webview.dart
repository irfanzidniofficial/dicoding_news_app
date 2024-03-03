// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dicoding_news_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;
  const ArticleWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));

    return CustomScaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
