import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: 'APL123',
    description: 'Fresh and juicy apples.',
    price: 1.99,
    reviews: [],
    expirationsMonths: 2,
    numberOfCalories: 52,
    unitAmount: 1,
    isOrganic: true,
    //image: File('path/to/image.jpg'),
    isFeatured: true,
    imageUrl: null,
  );
}

List<ProductEntity> getDummyProducts(int count) {
  return List.generate(count, (index) => getDummyProduct());
}
