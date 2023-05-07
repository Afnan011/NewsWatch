import 'package:flutter/material.dart';
import 'package:news_watch/model/constant_sources.dart';

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
      body: ListView.separated(
          itemBuilder: (context, index) => buildCard(index),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: listOfNewsChannel.length,
      ),


      // ExpansionTile(
      //   title: const Text('Channel'),
      //   children: [
      //     for (int i = 0; i < listOfNewsChannel.length; i++)
      //       DropDownList(
      //         call: () =>
      //             getNews(channel: listOfNewsChannel[i]['code']),
      //         name: listOfNewsChannel[i]['name']!.toUpperCase(),
      //       ),
      //   ],
      // ),
    );



  }


}
