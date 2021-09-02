import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/app/pages/home/widgets/news_feed_widget.dart';
import 'package:news_flutter/domain/domain.dart';

/// The home view which will show the home screen and perform the basic
/// ui work.
class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              StringConstants.appName,
              style: Styles.themeBold30,
            ),
            backgroundColor: Get.theme.backgroundColor,
            elevation: 3,
          ),
          floatingActionButton: (_controller.pageStatus == PageStatus.offline)
              ? FloatingActionButton(
                  onPressed: () {
                    _controller.callInitialApis();
                  },
                  child: const Icon(
                    Icons.wifi_off_rounded,
                  ),
                )
              : null,
          backgroundColor: Get.theme.backgroundColor,
          body: Stack(
            children: [
              // If data available then show the list
              if (_controller.newsFeed != null)
                if (_controller.newsFeed?.articles != null)
                  Expanded(
                    child: NewsFeedWidget(
                      articles: _controller.newsFeed!.articles,
                    ),
                  ),
              // Show error when no data is available
              if ((_controller.newsFeed?.articles.isEmpty ?? true) &&
                  _controller.pageStatus != PageStatus.idle &&
                  _controller.pageStatus != PageStatus.loading)
                Center(
                  child: Lottie.asset(
                    AssetConstants.error,
                  ),
                ),
              // Show loading dialog when fetching the data
              if (_controller.pageStatus == PageStatus.loading)
                Center(
                  child: Lottie.asset(
                    AssetConstants.loading,
                  ),
                ),
            ],
          ),
        ),
      );
}
