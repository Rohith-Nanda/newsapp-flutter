import 'package:flutter/material.dart';
import 'package:news_app/controller/NewsArt.dart';
import 'package:news_app/model/FetchNews.dart';
import 'package:news_app/widget/pagecontent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late  NewsArt newsart;
  bool _loading = true;
  GetNews() async {
    newsart = await FetchNews.fetchNews();
     setState((){
      _loading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    GetNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading ? Center(child: Container(child: CircularProgressIndicator())):PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
           onPageChanged: (value) {
             setState(() {
               _loading = true;
             });
             GetNews();
           },
           itemBuilder: (context, index) {
            return NewsContainer(
                imgUrl: newsart.imgUrl,
                newsCnt: newsart.newsCnt,
                newsHead: newsart.newsHead,
                newsDes: newsart.newsDes,
                newsUrl: newsart.newsUrl);
          }),
    );
  }
}