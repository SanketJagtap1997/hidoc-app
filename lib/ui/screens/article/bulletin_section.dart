import 'package:flutter/material.dart';
import 'package:hidoc/common/styles/color_pallet.dart';
import 'package:hidoc/common/utils/launch_url_service.dart';
import 'package:hidoc/common/utils/responsive.dart';
import 'package:hidoc/ui/screens/article/article_main_screen.dart';

class BulletinSection extends StatelessWidget {
  final ArticleViewModel vm;
  const BulletinSection({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Column(
          children: [
            getHidocBulletinWidget(vm),
            //Trending Hidoc Bulletin
            getTrendingHidocBulletin(vm),
          ],
        ),
        tablet: Column(
          children: [
            Divider(color: ColorPalette.lightgrey),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: getHidocBulletinWidget(vm)),

                //Trending Hidoc Bulletin
                Expanded(child: getTrendingHidocBulletin(vm))
              ],
            )
          ],
        ),
        desktop: Column(
          children: [
            Divider(color: ColorPalette.lightgrey),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: getHidocBulletinWidget(vm)),

                //Trending Hidoc Bulletin
                Expanded(child: getTrendingHidocBulletin(vm))
              ],
            )
          ],
        ));
  }

  Widget getHidocBulletinWidget(ArticleViewModel vm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Hidoc Bulletin",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 15),
        Container(
          height: 5,
          color: ColorPalette.robinBlue,
          width: 80,
        ),
        const SizedBox(height: 10),
        getHidocBulletinList(vm),
        const SizedBox(height: 15)
      ],
    );
  }

  Widget getTrendingHidocBulletin(ArticleViewModel vm) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorPalette.lightRobineBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trending Hidoc Bulletin",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          getTrendingBulletinList(vm),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget getHidocBulletinList(ArticleViewModel vm) {
    return ListView.separated(
      itemCount: vm.articleState.articleData?.bulletin?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, inddex) => Container(
        height: 5,
        color: ColorPalette.robinBlue,
        width: 80,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vm.articleState.articleData?.bulletin?[index].articleTitle ?? "",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              vm.articleState.articleData?.bulletin?[index].articleDescription ?? "",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => LaunchURL.openUrl(vm.articleState.articleData?.bulletin?[index].redirectLink ?? ""),
              child: Text(
                "Read More",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorPalette.robinBlue,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget getTrendingBulletinList(ArticleViewModel vm) {
    return ListView.separated(
      itemCount: vm.articleState.articleData?.trandingArticle?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, inddex) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vm.articleState.articleData?.trandingArticle?[index].articleTitle ?? "",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              vm.articleState.articleData?.trandingArticle?[index].articleDescription ?? "",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => LaunchURL.openUrl(vm.articleState.articleData?.trandingArticle?[index].redirectLink ?? ""),
              child: Text(
                "Read More",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorPalette.robinBlue,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
