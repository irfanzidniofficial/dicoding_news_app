import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/data/models/article.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_news_app/widgets/card_article.dart';

class ArticleListPage extends StatefulWidget {
  static const routeName = '/article_list';
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    _article = ApiService().topHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _article = ApiService().topHeadlines();
                });
              },
              child: const Text("Refresh Data"),
            ),
            FutureBuilder(
              future: _article,
              builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.articles?.length,
                      itemBuilder: (context, index) {
                        var article = snapshot.data?.articles?[index];
                        return CardArticle(
                          article: article!,
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Material(
                        child: Text(snapshot.error.toString()),
                      ),
                    );
                  } else {
                    return const Material(
                      child: Text(""),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
