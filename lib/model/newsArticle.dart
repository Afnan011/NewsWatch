class NewsArticle {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsContent;
  String newsUrl;

  NewsArticle({
      required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsContent,
      required this.newsUrl
      });


  static fromAPItoApp(Map<String, dynamic> article) {
    return NewsArticle(
        imgUrl: article["urlToImage"] ?? "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
        newsHead: article["title"] ?? "--",
        newsDesc: article["content"] ?? "--",
        newsContent: article["description"] ?? "--",
        newsUrl: article["url"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en"
    );
}

}
