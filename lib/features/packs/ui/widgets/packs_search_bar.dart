import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';

class PacksSearchBar extends StatelessWidget {
  const PacksSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search for packs",
      backgroundColor: WidgetStatePropertyAll(ColorsManager.borderColor),
    );
  }
}
