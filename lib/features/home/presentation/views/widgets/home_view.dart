import 'package:e_commerce_app/core/cubits/products_cubit/product_cubit_.dart';
import 'package:e_commerce_app/core/repos/products_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(gitIt.get<ProductRepo>()),

      child: HomeViewBody(),
    );
  }
}
