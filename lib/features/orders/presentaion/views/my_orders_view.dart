import 'package:e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/orders/presentaion/cubits/orders_cubit_cubit/orders_cubit.dart';
import 'package:e_commerce_app/features/orders/presentaion/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});
  static const String routeName = 'myOrders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(gitIt<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'طلباتي'),
        body: const MyOrdersViewBody(),
      ),
    );
  }
}
