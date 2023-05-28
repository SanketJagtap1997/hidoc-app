import 'package:flutter/material.dart';
import 'package:hidoc/common/utils/responsive.dart';
import 'package:hidoc/ui/screens/article/article_main_screen.dart';

class ArticleTypeSection extends StatelessWidget {
  final List<Widget> listOfArticleTypesWidgets;
  final ArticleViewModel vm;
  const ArticleTypeSection({required this.listOfArticleTypesWidgets, required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context)
            ? 1
            : Responsive.isTablet(context)
                ? 2
                : 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // width / height: fixed for *all* items
        childAspectRatio: !Responsive.isMobile(context) ? 0.98 : 1.5,
      ),
      itemCount: listOfArticleTypesWidgets.length,
      itemBuilder: (context, i) {
        return listOfArticleTypesWidgets[i];
      },
    );
  }
}
