import 'package:flutter/material.dart';
import 'package:hidoc/common/styles/color_pallet.dart';
import 'package:hidoc/common/utils/image_assets.dart';
import 'package:hidoc/common/utils/responsive.dart';
import 'package:hidoc/ui/screens/article/article_details.dart';
import 'package:hidoc/ui/screens/article/article_main_screen.dart';
import 'package:hidoc/ui/widgets/rounded_container.dart';
import 'package:intl/intl.dart';

class ArticleHeader extends StatelessWidget {
  final ArticleViewModel vm;
  const ArticleHeader({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedCurrentTime = DateFormat('hh:mm').format(now);
    return Responsive(
      mobile: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(ImagesAssets.bgLogo),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  formattedCurrentTime,
                  style: TextStyle(fontSize: 14, color: ColorPalette.white),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorPalette.lightRobineBlue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "hidoc",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: ColorPalette.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedContainer(
                      color: ColorPalette.transparent,
                      padding: const EdgeInsets.all(6),
                      borderColor: ColorPalette.white,
                      child: Icon(
                        Icons.home,
                        color: ColorPalette.white,
                      )),
                  Text(
                    "ARTICALS",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorPalette.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 45.0),
                    child: SizedBox(),
                  )
                ],
              ),
              const SizedBox(height: 15),
              ArticleDetails(vm: vm)
            ],
          ),
        ),
      ),
      tablet: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              "ARTICALS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorPalette.black),
            ),
            const SizedBox(height: 15),
            ArticleDetails(vm: vm)
          ],
        ),
      ),
      desktop: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            "ARTICALS",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorPalette.black),
          ),
          const SizedBox(height: 15),
          ArticleDetails(vm: vm)
        ],
      ),
    );

    // Container(
    //   width: double.infinity,
    //   height: MediaQuery.of(context).size.height,
    //   decoration: (Responsive.isMobile(context))
    //       ? BoxDecoration(
    //           image: DecorationImage(
    //           image: AssetImage(ImagesAssets.bgLogo),
    //           fit: BoxFit.cover,
    //         ))
    //       : const BoxDecoration(),
    //   child: Padding(
    //     padding: Responsive.isMobile(context)
    //         ? const EdgeInsets.all(16.0)
    //         : Responsive.isTablet(context)
    //             ? const EdgeInsets.all(64.0)
    //             : const EdgeInsets.symmetric(horizontal: 128.0),
    //     child: Column(
    //       children: [
    //         if ((Responsive.isMobile(context))) ...[
    //           const SizedBox(height: 20),
    //           Container(
    //             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
    //             decoration: BoxDecoration(
    //               color: ColorPalette.lightRobineBlue,
    //               borderRadius: const BorderRadius.only(
    //                 bottomLeft: Radius.circular(10),
    //                 bottomRight: Radius.circular(10),
    //               ),
    //             ),
    //             child: Text(
    //               "hidoc",
    //               style: TextStyle(fontSize: 14, color: ColorPalette.white, fontWeight: FontWeight.bold),
    //             ),
    //           ),

    //         ],
    //         Responsive.isMobile(context)
    //             ? const SizedBox(height: 15)
    //             : Responsive.isTablet(context)
    //                 ? const SizedBox(height: 32)
    //                 : const SizedBox(height: 128),

    //         if (!Responsive.isMobile(context))
    //           Text(
    //             "ARTICALS",
    //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorPalette.black),
    //           ),
    //         const SizedBox(height: 15),
    //         //getArticleDetails(vm)
    //         ArticleDetails(vm: vm)
    //       ],
    //     ),
    //   ),
    // );
  }
}
