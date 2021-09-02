import 'package:flutter/material.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/domain/domain.dart';

/// A news feed widget which will show the list of the news
///
/// [articles] are the list of articles
class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: articles.length,
        shrinkWrap: true,
        separatorBuilder: (__, _) => Divider(
          color: ColorsValue.themeOppositeColor(),
        ),
        itemBuilder: (_, position) {
          var singleNews = articles[position];

          return SingleNewsDetailsWidget(singleNews: singleNews);
        },
      );
}
