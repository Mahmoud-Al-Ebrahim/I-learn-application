
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/app_color.dart';
import 'filter_content_item.dart';

class ExpandableItem extends StatelessWidget {
  const ExpandableItem(this.header, this.expandedBody, {Key? key})
      : super(key: key);
  final String header;
  final Widget expandedBody;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: ExpandableThemeData(
          iconColor: AppColors.primaryColor[50]!,
          useInkWell: false,
          headerAlignment: ExpandablePanelHeaderAlignment.center),
      header: Text(
        header,
        style: Theme.of(context).textTheme.subtitle1!,
      ),
      collapsed: Container(),
      expanded: expandedBody
    );
  }
}
