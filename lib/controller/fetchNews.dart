import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_watch/model/newsArticle.dart';


class FetchNews{

   static String API_KEY = "7108a4e3ac0744428ae7355033095b05";

   static List sourcesId = [
     "abc-news",

     "bbc-news",
     "bbc-sport",

     "business-insider",

     "engadget",
     "entertainment-weekly",
     "espn",
     "espn-cric-info",
     "financial-post",

     "fox-news",
     "fox-sports",
     "globo",
     "google-news",
     "google-news-in",

     "medical-news-today",

     "national-geographic",

     "news24",
     "new-scientist",

     "new-york-magazine",
     "next-big-future",

     "techcrunch",
     "techradar",

     "the-hindu",

     "the-wall-street-journal",

     "the-washington-times",
     "time",
     "usa-today",

   ];

  static Future<NewsArticle> fetchNews() async{

    final randomSource = Random();
    var currentSourceID = sourcesId[randomSource.nextInt(sourcesId.length)];

    Response response = await get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&source=$currentSourceID&apiKey=$API_KEY"
    ));

    Map dataBody = jsonDecode(response.body);
    // if(dataBody["status"] == "error")
    //   {
    //     print('API Limit Reached!');
    //
    //     return NewsArticle.isError();
    //   }
    // else{
      List articles = dataBody["articles"];

        final randomArticle = Random();
        var currentArticle = articles[randomArticle.nextInt(articles.length)];

        return NewsArticle.fromAPItoApp(currentArticle);




  }

}