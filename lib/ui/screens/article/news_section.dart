import 'package:flutter/material.dart';
import 'package:hidoc/common/styles/color_pallet.dart';
import 'package:hidoc/common/utils/image_assets.dart';
import 'package:hidoc/common/utils/responsive.dart';
import 'package:hidoc/ui/screens/article/article_main_screen.dart';
import 'package:hidoc/ui/widgets/rounded_container.dart';

class NewsSection extends StatelessWidget {
  final ArticleViewModel vm;
  const NewsSection({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPalette.lightgrey.withOpacity(0.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "News",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                getNewsList(vm),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: ColorPalette.lightgrey),
            ),
            child: articleEvents(vm),
          ),
        ],
      ),
      tablet: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPalette.lightgrey.withOpacity(0.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "News",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                getNewsList(vm),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: ColorPalette.lightgrey),
            ),
            child: articleEvents(vm),
          ),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              // padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ColorPalette.lightgrey.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "News",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  getNewsList(vm)
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: ColorPalette.lightgrey),
            ),
            child: articleEvents(vm),
          ),
        ],
      ),
    );
  }

  getNewsList(ArticleViewModel vm) {
    return ListView.separated(
      itemCount: vm.articleState.articleData?.news?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, inddex) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Responsive.isMobile(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      vm.articleState.articleData?.news?[index].title ?? "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: vm.articleState.articleData?.news?[index].urlToImage == ""
                        ? Image.asset(
                            ImagesAssets.article,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            vm.articleState.articleData?.news?[index].urlToImage ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                ImagesAssets.article,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        vm.articleState.articleData?.news?[index].title ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Responsive.isTablet(context) ? 300 : 500,
                    height: 250,
                    child: vm.articleState.articleData?.news?[index].urlToImage == ""
                        ? Image.asset(
                            ImagesAssets.article,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            vm.articleState.articleData?.news?[index].urlToImage ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                ImagesAssets.article,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                  ),
                ],
              );
      },
    );
  }

  Widget articleEvents(ArticleViewModel vm) {
    return Column(
      children: [
        Row(
          children: [
            RoundedContainer(
              child: Icon(
                Icons.rocket_launch,
                size: 20,
                color: ColorPalette.robinBlue,
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Quizzes : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Participate & Win Exiting Prizes ', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            )
          ],
        ),
        Divider(
          color: ColorPalette.lightgrey,
        ),
        Row(
          children: [
            RoundedContainer(
              child: Icon(
                Icons.calculate,
                size: 20,
                color: ColorPalette.robinBlue,
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Medical Calculators : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Get Access to 800+ Evidence Based Calculators ', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            )
          ],
        ),
        Divider(
          color: ColorPalette.lightgrey,
        ),
      ],
    );
  }
}
