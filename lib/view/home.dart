import 'package:flutter/material.dart';
import 'package:news_watch/controller/fetchNews.dart';
import 'package:news_watch/model/newsArticle.dart';
import 'package:news_watch/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArticle article = NewsArticle(
    imgUrl:
        'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
    newsHead: 'Loading News for you!',
    newsContent: 'Please wait for a moment',
    newsDesc: '...',
    newsUrl: 'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en',
  );

  bool isLoading = true;

  getNews() async {
    article = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          getNews();
          setState(() {
            isLoading = false;
          });
        },
        itemBuilder: (context, index) {

          return isLoading ? const Center(child: CircularProgressIndicator()) :

          newsContainer(
                  imgUrl: article.imgUrl,
                  newsHead: article.newsHead,
                  newsContent: article.newsContent,
                  newsDesc: article.newsDesc,
                  newsUrl: article.newsUrl);
        },
      ),
    );
  }
}