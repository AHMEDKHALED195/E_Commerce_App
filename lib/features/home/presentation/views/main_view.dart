import 'package:e_commerce_app/features/home/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final pages = const [HomeView(), ProductsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
