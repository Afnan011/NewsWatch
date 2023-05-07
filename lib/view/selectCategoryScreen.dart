import 'package:flutter/material.dart';

import '../model/constant_sources.dart';
import 'detailView.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Select Category",
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 24,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: listOfCategory.length,
          itemBuilder: (context, index) => Card(
            child: InkWell(
              onTap: () {
                String newsUrl = listOfCategory[index]['url']!;
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
                    listOfCategory[index]['name']!.toUpperCase(),
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
