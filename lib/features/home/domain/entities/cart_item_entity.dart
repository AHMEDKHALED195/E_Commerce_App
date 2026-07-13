import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;
  CartItemEntity({required this.productEntity, this.count = 0});
  num get totalPrice => productEntity.price * count;
  num get totalWeight => productEntity.unitAmount * count;
  void incrementCount() {
    count++;
  }

  void decrementCount() {
    if (count > 0) count--;
  }

  @override
  List<Object?> get props => [productEntity];
}
