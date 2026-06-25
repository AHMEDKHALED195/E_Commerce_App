part of 'product_cubit_.dart';

@immutable
sealed class ProductState {}

final class ProducInitial extends ProductState {}

final class ProducLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}

final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
