import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entites/order_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  final OrdersRepo ordersRepo;

  Future<void> getUserOrders() async {
    emit(OrdersLoading());

    var jsonData = Prefs.getString(kUserData);
    var user = UserModel.fromJson(jsonDecode(jsonData));

    var result = await ordersRepo.getUserOrders(uId: user.uId);

    result.fold(
      (failure) => emit(OrdersFailure(failure.message)),
      (orders) => emit(OrdersSuccess(orders)),
    );
  }
}
