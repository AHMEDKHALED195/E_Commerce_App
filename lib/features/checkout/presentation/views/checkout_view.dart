import 'package:e_commerce_app/core/helper_functions/get_user.dart';
import 'package:e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:e_commerce_app/features/checkout/domain/entites/order_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      uID: getUser().uId,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(gitIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الشحن',
          showNotificationIcon: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
