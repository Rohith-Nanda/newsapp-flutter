import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDes,
      required this.newsCnt,
      required this.newsHead,
      required this.newsUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(imgUrl,height: 400,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Text(
              newsHead.length > 90
                  ? "${newsHead.substring(0, 90)}..."
                  : newsHead,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "a",
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              newsCnt,
              maxLines: 3,
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Text("Read More")),
            ),
          ],
        ),
        Center(
            child: TextButton(
                onPressed: () async {
                },
                child: Text(
                  "News Provided By NewsAPI.org",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ))),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}