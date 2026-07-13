import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlockConsumer extends StatelessWidget {
  const MainViewBodyBlockConsumer({
    super.key,
    required this.currentIndex,
    required this.pages,
  });

  final int currentIndex;
  final List<StatelessWidget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductItemAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تمت إضافة المنتج إلى السلة'),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is CartProductItemRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تمت إزالة المنتج من السلة'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },

      child: MainViewBody(currentIndex: currentIndex, pages: pages),
    );
  }
}
