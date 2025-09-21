import 'package:flutter/material.dart';
import 'package:moltaqa/features/packs/ui/widgets/packs_categories.dart';
import 'package:moltaqa/features/packs/ui/widgets/packs_listview.dart';
import 'package:moltaqa/features/packs/ui/widgets/packs_search_bar.dart';

class PacksScreen extends StatelessWidget {
  const PacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              spacing: 20,
              children: [
                const PacksCategories(),
                PacksSearchBar(),
                PacksListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
