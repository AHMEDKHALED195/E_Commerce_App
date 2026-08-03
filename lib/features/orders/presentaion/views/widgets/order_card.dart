import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/checkout/domain/entites/order_entity.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrderEntity order;

  Color get _statusColor {
    switch (order.status) {
      case 'delivered':
        return const Color(0xFF2D9F5D);
      case 'cancelled':
        return const Color(0xFFE74C3C);
      default:
        return const Color(0xFFF4A91F);
    }
  }

  String get _statusLabel {
    switch (order.status) {
      case 'delivered':
        return 'تم التوصيل';
      case 'cancelled':
        return 'ملغي';
      default:
        return 'قيد التنفيذ';
    }
  }

  String get _formattedDate {
    try {
      var date = DateTime.parse(order.date);
      var month = date.month.toString().padLeft(2, '0');
      var day = date.day.toString().padLeft(2, '0');
      return '${date.year}/$month/$day';
    } catch (_) {
      return order.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.orderId.length > 8
                      ? '#${order.orderId.substring(0, 8)}'
                      : '#${order.orderId}',
                  style: TextStyles.semiBold16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyles.semiBold11.copyWith(color: _statusColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _formattedDate,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF9AA1A1),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: Color(0xFFEDEEEE), height: 1),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${order.orderProducts.length} منتج',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF9AA1A1),
                ),
              ),
              Text(
                '${order.totalPrice.toStringAsFixed(0)} ج.م',
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
