part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;
  OrdersSuccess(this.orders);
}

final class OrdersFailure extends OrdersState {
  final String message;
  OrdersFailure(this.message);
}
