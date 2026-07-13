import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/main_view_body_block_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final pages = const [HomeView(), ProductsView(), CartView()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: MainViewBodyBlockConsumer(
            currentIndex: currentIndex,
            pages: pages,
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onItemTapped: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
