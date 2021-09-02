// To parse this JSON data, do
//
//     final newsFeed = newsFeedFromMap(jsonString);

import 'dart:convert';

class NewsFeed {
  NewsFeed({
    required this.status,
    required this.articles,
  });

  factory NewsFeed.fromJson(String str) => NewsFeed.fromMap(
        json.decode(str) as Map<String, dynamic>,
      );

  factory NewsFeed.fromMap(Map<String, dynamic> json) => NewsFeed(
        status: json['status'] as String,
        articles: List<Article>.from(
          (json['articles'] as List<dynamic>).map<dynamic>(
            (dynamic x) => Article.fromMap(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );

  String status;
  List<Article> articles;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        'status': status,
        'articles': List<Map<String, dynamic>>.from(
          articles.map<Map<String, dynamic>>(
            (x) => x.toMap(),
          ),
        ),
      };
}

class Article {
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(String str) => Article.fromMap(
        json.decode(str) as Map<String, dynamic>,
      );

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        author: json['author'] as String? ?? '',
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        url: json['url'] as String? ?? '',
        urlToImage: json['urlToImage'] as String? ?? '',
        publishedAt: (json['publishedAt'] != null)
            ? DateTime.parse(json['publishedAt'] as String)
            : null,
        content: json['content'] as String? ?? '',
      );

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime? publishedAt;
  String content;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt?.toIso8601String(),
        'content': content,
      };
}
