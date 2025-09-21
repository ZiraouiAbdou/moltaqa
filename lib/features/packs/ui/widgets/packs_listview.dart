import 'package:flutter/material.dart';
import 'package:moltaqa/features/packs/ui/widgets/pack_card.dart';

class PacksListView extends StatelessWidget {
  const PacksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => PackCard(),
    );
  }
}
