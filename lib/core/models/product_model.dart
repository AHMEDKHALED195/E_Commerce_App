import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.isFeatured,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isOrganic: entity.isOrganic,
      expirationsMonths: entity.expirationsMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewsList =
        (json['reviews'] as List<dynamic>?)
            ?.map((e) => ReviewModel.fromJson(e))
            .toList() ??
        [];

    return ProductModel(
      reviews: reviewsList,
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      expirationsMonths: json['expirationsMonths'] ?? 0,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'],
      avgRating:
          json['avgRating'] ??
          getAvgRating(reviewsList.map((e) => e.toEntity()).toList()),
      ratingCount: json['ratingCount'] ?? reviewsList.length,
      sellingCount: json['sellingCount'] ?? 0,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      reviews: reviews.map((e) => e.toEntity()).toList(),
      name: name,
      code: code,
      description: description,
      price: price,
      isOrganic: isOrganic,
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }

  static num getAvgRating(List<ReviewEntity> reviews) {
    if (reviews.isEmpty) {
      return 0;
    }

    num totalRating = reviews.fold(0, (sum, review) => sum + review.ratting);

    return totalRating / reviews.length;
  }
}
