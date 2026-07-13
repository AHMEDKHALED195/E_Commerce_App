import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentIndex,
    required this.pages,
  });

  final int currentIndex;
  final List<StatelessWidget> pages;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: currentIndex, children: pages);
  }
}
