import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(items: []);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      // CartItemEntity cartItem = cartEntity.items.firstWhere(
      //     (item) => item.productEntity.code == productEntity.code);
      cartItem.incrementCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartProductItemAdded());
  }

  void removeItemFromCart(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(CartProductItemRemoved());
  }

  void updateCartItem(CartItemEntity cartItem) {
    if (cartItem.count <= 0) {
      removeItemFromCart(cartItem);
    } else {
      emit(CartProductItemUpdated());
    }
  }
}
