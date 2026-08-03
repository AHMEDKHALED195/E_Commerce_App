import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/features/orders/presentaion/cubits/orders_cubit_cubit/orders_cubit.dart';
import 'package:e_commerce_app/features/orders/presentaion/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().getUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(state.message, textAlign: TextAlign.center),
              ),
            );
          } else if (state is OrdersSuccess) {
            if (state.orders.isEmpty) {
              return const Center(child: Text('لا يوجد طلبات حتى الآن'));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              itemCount: state.orders.length,
              itemBuilder: (context, index) =>
                  OrderCard(order: state.orders[index]),
            );
          }
          // Loading / Initial
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
