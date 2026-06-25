import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}

Future<void> addProduct() async {
  await FirebaseFirestore.instance.collection('products').add({
    'name': 'Apple',
    'code': 'APL001',
    'description': 'Fresh red apples',
    'price': 70,
    'imageUrl': 'https://example.com/apple.jpg',
    'isFeatured': true,
    'expirationsMonths': 6,
    'isOrganic': true,
    'numberOfCalories': 52,
    'unitAmount': 1,
    'avgRating': 0,
    'ratingCount': 0,
    'reviews': [],
  });
}
