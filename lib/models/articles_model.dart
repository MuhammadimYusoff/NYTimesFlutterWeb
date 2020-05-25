class Article {
  
  final String title;
  final String byline;
  final String url;
  final String imageUrl;
  final String publishedDate;
  final String summary;

  Article({
    this.title,
    this.byline,
    this.url,
    this.imageUrl,
    this.publishedDate,
    this.summary,
  });



  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'], 
      byline: map['byline'], 
      url: map['url'], 
      imageUrl: map['multimedia'].length > 0 
      ? map['multimedia'][3]['url']
      : 'https://images6.alphacoders.com/567/thumb-1920-567760.jpg',
      publishedDate: map['published_date'], 
      summary: map['abstract'], 
    );
  }
}