import 'package:e_commerce_app/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entites/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;
  final String status;
  final String date;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    this.status = 'pending',
    String? date,
  }) : date = date ?? DateTime.now().toString();

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      orderId: const Uuid().v4(),
      totalPrice: orderEntity.cartEntity.totalPrice,
      uId: orderEntity.uID,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        orderEntity.shippingAddressEntity,
      ),
      orderProducts: orderEntity.cartEntity.items
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'Paypal',
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'] ?? '',
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      uId: json['uId'] ?? '',
      status: json['status'] ?? 'pending',
      date: json['date'] ?? DateTime.now().toString(),
      shippingAddressModel: ShippingAddressModel.fromJson(
        (json['shippingAddressModel'] ?? {}) as Map<String, dynamic>,
      ),
      orderProducts: ((json['orderProducts'] ?? []) as List)
          .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: json['paymentMethod'] ?? 'Cash',
    );
  }

  toJson() => {
    'orderId': orderId,
    'totalPrice': totalPrice,
    'uId': uId,
    'status': status,
    'date': date,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };

  OrderEntity toEntity() {
    return OrderEntity(
      orderId: orderId,
      totalPrice: totalPrice,
      status: status,
      date: date,
      paymentMethod: paymentMethod,
      shippingAddressModel: shippingAddressModel,
      orderProducts: orderProducts,
    );
  }
}

// payment method
