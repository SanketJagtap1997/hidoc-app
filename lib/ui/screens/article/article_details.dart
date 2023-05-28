import 'package:flutter/material.dart';
import 'package:hidoc/common/styles/color_pallet.dart';
import 'package:hidoc/common/utils/image_assets.dart';
import 'package:hidoc/common/utils/launch_url_service.dart';
import 'package:hidoc/common/utils/responsive.dart';
import 'package:hidoc/ui/screens/article/article_main_screen.dart';
import 'package:hidoc/ui/screens/article/article_type_section.dart';
import 'package:hidoc/ui/screens/article/bulletin_section.dart';
import 'package:hidoc/ui/screens/article/news_section.dart';
import 'package:hidoc/ui/widgets/bordered_container.dart';
import 'package:intl/intl.dart';

class ArticleDetails extends StatefulWidget {
  final ArticleViewModel vm;
  const ArticleDetails({required this.vm, super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  List<String> list = <String>["Critical Care"];
  late String dropdownValue = list.first;
  late ArticleViewModel vm;
  List<Widget> listOfArticleTypesWidgets = [];
  @override
  void initState() {
    vm = widget.vm;
    listOfArticleTypesWidgets.clear();
    listOfArticleTypesWidgets.addAll([
      BorderedContainer(
        padding: const EdgeInsets.all(12),
        borderColor: ColorPalette.grey.withOpacity(0.5),
        borderRadius: 0,
        child: Column(
          children: [
            const Text(
              "Latest Articles",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: ColorPalette.grey.withOpacity(0.4),
              thickness: 1,
            ),
            Expanded(child: getLatestArticleList(vm))
          ],
        ),
      ),
      BorderedContainer(
        padding: const EdgeInsets.all(12),
        borderColor: ColorPalette.grey.withOpacity(0.5),
        borderRadius: 0,
        child: Column(
          children: [
            const Text(
              "Trending Articles",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(child: getTrendingArticleList(vm))
            //Explore more Article
          ],
        ),
      ),
      Column(
        children: [
          Expanded(
            child: BorderedContainer(
              padding: const EdgeInsets.all(12),
              borderColor: ColorPalette.grey.withOpacity(0.5),
              borderRadius: 0,
              child: Column(
                children: [
                  const Text(
                    "Explore more in Articles",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: ColorPalette.grey.withOpacity(0.4),
                    thickness: 1,
                  ),
                  Expanded(
                    child: getExploreMoreArticle(vm),
                  )

                  //Explore more Article
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorPalette.orange,
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
                child: Text(
                  'Explore Hidoc Dr.',
                  style: TextStyle(fontSize: 12, color: ColorPalette.white),
                ),
              ),
            ),
          )
        ],
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Responsive.isDesktop(context) ? const EdgeInsets.symmetric(horizontal: 48) : EdgeInsets.zero,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    focusColor: ColorPalette.white,
                    elevation: 16,
                    isDense: true,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    underline: SizedBox(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Responsive.isMobile(context) ? const SizedBox(height: 15) : const SizedBox(height: 25),
            Container(
              margin: EdgeInsets.zero,
              decoration: Responsive.isMobile(context)
                  ? BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(0.0, 0.75),
                      ),
                    ])
                  : BoxDecoration(),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Responsive.isMobile(context)
                  ? Column(
                      children: [
                        //get the article image
                        getResponsiveArticleImage(vm),
                        articleDescription(vm),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getResponsiveArticleImage(vm),
                        const SizedBox(width: 15),
                        articleDescription(vm),
                      ],
                    ),
            ),
            Responsive.isMobile(context) ? const SizedBox(height: 15) : const SizedBox(height: 25),

            // // //get hidoc Bulletin

            BulletinSection(vm: vm),

            !Responsive.isMobile(context) ? const SizedBox(height: 45) : const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: !Responsive.isMobile(context) ? ColorPalette.robinBlue : ColorPalette.orange,
                ),
                onPressed: () {},
                child: Padding(
                  padding: !Responsive.isMobile(context) ? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 128) : const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
                  child: Text(
                    'Read More Bulletins',
                    style: TextStyle(fontSize: 12, color: ColorPalette.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ArticleTypeSection(
              listOfArticleTypesWidgets: listOfArticleTypesWidgets,
              vm: vm,
            ),

            const SizedBox(height: 30),
            const Center(
              child: Text(
                "What's more on Hidoc Dr.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // news Section
            NewsSection(vm: vm),

            const SizedBox(height: 30),

            Container(
              color: Responsive.isMobile(context) ? ColorPalette.orange.withOpacity(0.2) : ColorPalette.robinBlue.withOpacity(0.2),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      "Social Network for doctors - A Special feature on Hidoc Dr.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Responsive.isMobile(context) ? ColorPalette.orange : ColorPalette.robinBlue, shape: StadiumBorder()),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'visit',
                        style: TextStyle(fontSize: 12, color: ColorPalette.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget getResponsiveArticleImage(ArticleViewModel vm) {
    return Responsive(
      desktop: Stack(
        children: [
          vm.articleState.articleData?.article?.articleImg == ""
              ? Image.asset(
                  ImagesAssets.article,
                  fit: BoxFit.fill,
                  width: Responsive.isMobile(context)
                      ? double.infinity
                      : Responsive.isTablet(context)
                          ? 350
                          : 500,
                )
              : Image.network(
                  vm.articleState.articleData?.article?.articleImg ?? "",
                  fit: BoxFit.cover,
                  width: Responsive.isMobile(context)
                      ? double.infinity
                      : Responsive.isTablet(context)
                          ? 350
                          : 500,
                ),
          Positioned(bottom: 0, right: 0, child: pointsContainer(vm, borderRadius: const BorderRadius.only(topLeft: Radius.circular(12))))
        ],
      ),
      tablet: Stack(
        children: [
          vm.articleState.articleData?.article?.articleImg == ""
              ? Image.asset(
                  ImagesAssets.article,
                  fit: BoxFit.fill,
                  width: Responsive.isMobile(context) ? double.infinity : 350,
                )
              : Image.network(
                  vm.articleState.articleData?.article?.articleImg ?? "",
                  fit: BoxFit.cover,
                  width: Responsive.isMobile(context) ? double.infinity : 350,
                ),
          Positioned(bottom: 0, right: 0, child: pointsContainer(vm, borderRadius: const BorderRadius.only(topLeft: Radius.circular(12))))
        ],
      ),
      mobile: vm.articleState.articleData?.article?.articleImg == ""
          ? ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.asset(
                ImagesAssets.article,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            )
          : ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.network(
                vm.articleState.articleData?.article?.articleImg ?? "",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              )),
    );
  }

  Widget pointsContainer(ArticleViewModel vm, {BorderRadius borderRadius = const BorderRadius.only(bottomRight: Radius.circular(12))}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: ColorPalette.robinBlue, borderRadius: borderRadius),
      child: Column(
        children: [
          Text(
            "Points",
            style: TextStyle(
              color: ColorPalette.white,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${vm.articleState.articleData?.article?.rewardPoints ?? ""}',
            style: TextStyle(
              color: ColorPalette.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget articleDescription(ArticleViewModel vm) {
    return Responsive.isMobile(context)
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.5),
            decoration: BoxDecoration(color: ColorPalette.white, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    vm.articleState.articleData?.article?.articleTitle ?? "",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(vm.articleState.articleData?.article?.articleDescription ?? "", style: const TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => LaunchURL.openUrl(vm.articleState.articleData?.article?.redirectLink ?? ""),
                          child: Text(
                            "Read full article to earn points",
                            style: TextStyle(
                                decoration: TextDecoration.underline, color: ColorPalette.robinBlue, fontSize: 12, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      pointsContainer(vm)
                    ],
                  ),
                ),
              ],
            ))
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    vm.articleState.articleData?.article?.articleTitle ?? "",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(vm.articleState.articleData?.article?.articleDescription ?? "", style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 20),
                InkWell(
                    onTap: () => LaunchURL.openUrl(vm.articleState.articleData?.article?.redirectLink ?? ""),
                    child: Text(
                      "Read full article to earn points",
                      style: TextStyle(decoration: TextDecoration.underline, color: ColorPalette.robinBlue, fontSize: 12, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    )),
                const SizedBox(height: 20),
                Text(
                  "Published Date: ${DateFormat('d MMM yyyy').format(DateTime.parse(vm.articleState.articleData?.article?.createdAt ?? ""))}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
  }

  Widget getLatestArticleList(ArticleViewModel vm) {
    return ListView.separated(
      itemCount: vm.articleState.articleData?.latestArticle?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, inddex) => Divider(
        color: ColorPalette.lightgrey,
      ),
      itemBuilder: (context, index) {
        return Text(
          vm.articleState.articleData?.latestArticle?[index].articleTitle ?? "",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        );
      },
    );
  }

  Widget getTrendingArticleList(ArticleViewModel vm) {
    return ListView.separated(
      itemCount: vm.articleState.articleData?.trandingArticle?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, inddex) => Divider(
        color: ColorPalette.lightgrey,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 170,
              child: vm.articleState.articleData?.trandingArticle?[index].articleImg == ""
                  ? Image.asset(
                      ImagesAssets.article,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      vm.articleState.articleData?.trandingArticle?[index].articleImg ?? "",
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 10),
            Text(
              vm.articleState.articleData?.trandingArticle?[index].articleTitle ?? "",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        );
      },
    );
  }

  getExploreMoreArticle(ArticleViewModel vm) {
    return ListView.separated(
      itemCount: vm.articleState.articleData?.exploreArticle?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, inddex) => Divider(
        color: ColorPalette.lightgrey,
      ),
      itemBuilder: (context, index) {
        return Text(
          vm.articleState.articleData?.exploreArticle?[index].articleTitle ?? "",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        );
      },
    );
  }
}
