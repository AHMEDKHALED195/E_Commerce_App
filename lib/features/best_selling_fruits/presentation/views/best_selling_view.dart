import 'package:e_commerce_app/core/widgets/build_app_bar.dart';

import 'package:e_commerce_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'االأكثر مبيعًا'),
      body: const BestSellingViewBody(),
    );
  }
}
