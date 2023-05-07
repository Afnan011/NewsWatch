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

  // static isError(){
  //   return NewsArticle(
  //       imgUrl: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
  //       newsHead: "API LIMIT Reached.",
  //       newsDesc: "please try after some times.",
  //       newsContent: "...",
  //       newsUrl: "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en"
  //   );
  // }

  // static List<String> API_KEYS = ["7108a4e3ac0744428ae7355033095b05", "bd55f5254a51444a97868c574afb5726", "10c24baf380741cf8cdd984d594426b2"];


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
