import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;
  CartEntity({required this.items});

  void addCartItem(CartItemEntity cartItem) {
    items.add(cartItem);
  }

  void removeCartItem(CartItemEntity cartItem) {
    items.remove(cartItem);
  }

  bool isExist(ProductEntity product) =>
      items.any((item) => item.productEntity == product);

  CartItemEntity getCartItem(ProductEntity product) {
    for (var item in items) {
      if (item.productEntity == product) {
        return item;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

  double get totalPrice => items.fold(
    0,
    (previousValue, element) => previousValue + element.totalPrice,
  );
}
