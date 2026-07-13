part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartProductItemAdded extends CartState {}

final class CartProductItemRemoved extends CartState {}
