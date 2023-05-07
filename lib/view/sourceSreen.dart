import 'package:flutter/material.dart';
import 'package:news_watch/model/constant_sources.dart';

import 'detailView.dart';

class SourceScreen extends StatelessWidget {
  const SourceScreen({Key? key}) : super(key: key);


  Widget buildCard(int index) => ClipRect(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.teal.shade200, Colors.white],
                  tileMode: TileMode.repeated,
              )),

           width: double.infinity,
           // color: Colors.teal[50],
           child:  Padding(
             padding: const EdgeInsets.all(10.0),
             child: Text(
               listOfNewsChannel[index]['name']!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
             ),
           ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Sources",
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 24,
            ),
          ),
        ),
      ),
      body: 
      // ListView.separated(
      //     itemBuilder: (context, index) => buildCard(index),
      //     separatorBuilder: (context, index) => const SizedBox(height: 10),
      //     itemCount: listOfNewsChannel.length,
      // ),
      
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: listOfNewsChannel.length,
            itemBuilder: (context, index) => Card(
              child: InkWell(
                onTap: () {
                  String newsUrl = listOfNewsChannel[index]['url']!;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedViewPage(newsUrl: newsUrl)));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        radius: 1,
                        colors: [Colors.black12,  Colors.black38],
                      )),

                  child: Center(
                    child: Text(
                      listOfNewsChannel[index]['name']!.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Image.asset("assets/channels/${listOfNewsChannel[index]['code']!}.png",
                    // fit: BoxFit.cover,
                    // ),

                  ),
                ),
              ),
            ),
        ),
      ),

      
    );



  }


}
