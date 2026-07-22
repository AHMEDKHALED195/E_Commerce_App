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
    'imageUrl':
        'https://thumbs.dreamstime.com/b/red-apple-isolated-clipping-path-19130134.jpg',
    'isFeatured': true,
    'expirationsMonths': 6,
    'isOrganic': true,
    'numberOfCalories': 52,
    'unitAmount': 1,
    'avgRating': 0,
    'ratingCount': 0,
    'reviews': [],
  });

  await FirebaseFirestore.instance.collection('products').add({
    'name': 'Banana',
    'code': 'BAN001',
    'description': 'Fresh yellow bananas',
    'price': 30,

    'imageUrl':
        'https://img.magnific.com/free-photo/single-banana-isolated-white-background_839833-17794.jpg?semt=ais_hybrid&w=740&q=80',
    'isFeatured': false,
    'expirationsMonths': 3,
    'isOrganic': false,
    'numberOfCalories': 89,
    'unitAmount': 1,
    'avgRating': 0,
    'ratingCount': 0,
    'reviews': [],
  });
}
