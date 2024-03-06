import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/features/search/Presentation/widgets/filter_button.dart';

import '../../../../Helper/app_color.dart';
import '../../../authentication/Presentation/Widgets/custom_text_input.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool focused = false;
  late final TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: size.width * 0.75,
        child: TextFormField(
          onTap: () {
            setState(() {
              focused = true;
            });
          },
          controller: _searchController,
          autofocus: false,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: focused ? AppColors.primaryColor[25]! : Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.primaryColor[25]!),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintStyle: TextStyle(
                  color: focused ? AppColors.primaryColor[25]! : Colors.grey),
              hintText: 'Search'),
        ),
      ),
      Spacer(
        flex: 2,
      ),
      const FilterButton(),
    ]);
  }
}
