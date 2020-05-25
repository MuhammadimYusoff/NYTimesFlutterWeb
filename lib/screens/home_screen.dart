import 'package:BuildWeb/helpers/reponsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:BuildWeb/services/api_service.dart';
import 'package:BuildWeb/models/articles_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> _articles = [];

  @override
  void initState() { 
    super.initState();
    _fetchArticles();
  }

  _fetchArticles() async {
    List<Article> articles = await APIService().fetchArticlesBySection('technology');
    setState(() {
      _articles = articles;
    });
  }

  _buildArticleGrid(MediaQueryData mediaQuery) {
    List<GridTile> tiles = [];
    _articles.forEach((article) {
      tiles.add(_buildArticleTile(article, mediaQuery));
    });

    return Padding(
      padding: responsivePadding(mediaQuery),
      child: GridView.count(
        crossAxisCount: responsiveNumGridTiles(mediaQuery), 
        mainAxisSpacing: 30, 
        crossAxisSpacing: 30, 
        shrinkWrap: true, 
        physics: NeverScrollableScrollPhysics(), 
        children: tiles,
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url); 
    } else {
      throw 'Could not launch $url';
    }
  }

  _buildArticleTile(Article article, MediaQueryData mediaQuery) {
    return GridTile(
      child: GestureDetector(
        onTap: () => _launchURL(article.url),
              child: Column(
          children: [// Untuk Article punya Gambar
            Container(
              height: responsiveImageHeight(mediaQuery),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(image: NetworkImage(article.imageUrl),
                fit: BoxFit.cover,
                ),
              ),
            ),
            Container( // Untuk Article punya Tajuk
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: responsiveTitleHeight(mediaQuery),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,1),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
    ],
    ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 80.0),
          Center(
            child: Text(
              'The New York Times\nTop Tech Articles',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
              ),
          ),
          ),
          SizedBox(height: 15.0),
          _articles.length > 0 
          ? _buildArticleGrid(mediaQuery) 
          : Center(child: CircularProgressIndicator(),
          ),
        ]
      ),
    );
  }
}