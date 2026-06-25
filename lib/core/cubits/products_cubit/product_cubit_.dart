import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProducInitial());

  final ProductRepo productRepo;
  int productLength = 0;

  Future<void> getProducts() async {
    emit(ProducLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProducLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductError(failure.message)), (products) {
      productLength += products.length;
      emit(ProductSuccess(products));
    });
  }
}
