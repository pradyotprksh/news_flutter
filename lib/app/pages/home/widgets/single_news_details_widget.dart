import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/domain/domain.dart';

/// A widget which will show the single news details
///
/// [singleNews] contains the details of the news
class SingleNewsDetailsWidget extends StatelessWidget {
  SingleNewsDetailsWidget({
    Key? key,
    required this.singleNews,
  }) : super(key: key);

  final Article singleNews;
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          if (_homeController.pageStatus == PageStatus.offline) {
            Utility.showMessage(
              StringConstants.noInternet,
              MessageType.error,
              null,
              StringConstants.okay,
            );
          } else {
            Utility.openUrl(singleNews.url);
          }
        },
        child: Container(
          padding: Dimens.edgeInsets15_15_15_15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    Dimens.twenty,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: singleNews.urlToImage,
                  width: double.infinity,
                  height: Dimens.hundred + Dimens.eighty,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, dynamic ___) => Center(
                    child: Lottie.asset(
                      AssetConstants.error,
                    ),
                  ),
                ),
              ),
              Dimens.boxHeight10,
              Text(
                singleNews.title,
                style: Styles.themeBold20,
              ),
              Dimens.boxHeight5,
              if (_homeController.pageStatus != PageStatus.offline)
                Text(
                  singleNews.description,
                  style: Styles.theme15,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              if (_homeController.pageStatus == PageStatus.offline)
                Text(
                  singleNews.content,
                  style: Styles.theme15,
                ),
              Dimens.boxHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${StringConstants.by} ${singleNews.author}',
                    style: Styles.theme12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Dimens.boxWidth10,
                  if (_homeController.pageStatus != PageStatus.offline)
                    IconButton(
                      onPressed: () {
                        _homeController.markNewsOffline(singleNews);
                      },
                      icon: const Icon(
                        Icons.download_rounded,
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      );
}
