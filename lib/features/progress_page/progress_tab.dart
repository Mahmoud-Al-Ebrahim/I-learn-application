import 'package:flutter/material.dart';
import 'package:graduation_project/features/progress_page/item_card.dart';


class ProgressTab extends StatelessWidget {
  const ProgressTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: ListView.separated(
        itemCount: 8,
          separatorBuilder: (_,__)=>const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          itemBuilder: (context,index){
        return const ItemCard();
      }),
    );
  }
}
