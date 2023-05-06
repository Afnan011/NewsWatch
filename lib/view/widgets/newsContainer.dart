import 'package:flutter/material.dart';
import 'package:news_watch/view/detailView.dart';

class newsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsContent;
  String newsUrl;

  newsContainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsContent,
    required this.newsUrl,
  });



  @override
  Widget build(BuildContext context) {

    String newsDescription = newsDesc;

    void initNewsDesc() {
      try{
        newsDescription =  newsDesc.length > 250 ? newsDesc.toString().substring(0, 250) :
        "${newsDesc.toString().substring(0, newsDesc.length - 15)}...";

        if(newsDescription.startsWith("<li>")){
          newsDescription = newsDescription.substring(4, newsDescription.length);
        }
      }
      catch (e){
        newsDescription = newsDesc;
      }
    }

    initNewsDesc();


    return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                placeholder: "assets/loading.gif",
                image: imgUrl,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Text(
                    newsHead.length > 60 ? "${newsHead.substring(0, 60)}..." : newsHead,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    newsContent,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    newsDescription,

                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedViewPage(newsUrl: newsUrl)
                          ));
                        },
                        child: const Text("Read More")
                    ),
                  ),
                ],
            ),

            const SizedBox(height: 20),

            ],
      ),
    ));
  }


}