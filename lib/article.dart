class Article {
  String title;
  String description;
  String imageUrl;

  Article({this.title, this.description, this.imageUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        description: json['description'],
        imageUrl: json['urlToImage']);
  }
}
