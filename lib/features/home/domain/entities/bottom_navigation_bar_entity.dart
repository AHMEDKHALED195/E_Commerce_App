import 'package:e_commerce_app/core/utiles/app_images.dart';

class BottomNavigationBarEntity {
  final String title;
  final String activeIcon, inactiveIcon;

  BottomNavigationBarEntity({
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    title: 'الرئيسية',
    activeIcon: Assets.imagesVuesaxBoldHome,
    inactiveIcon: Assets.imagesVuesaxOutlineHome,
  ),
  BottomNavigationBarEntity(
    title: 'المنتجات',
    activeIcon: Assets.imagesVuesaxBoldProducts,
    inactiveIcon: Assets.imagesVuesaxOutlineProducts,
  ),

  BottomNavigationBarEntity(
    title: 'سلة التسوق',
    activeIcon: Assets.imagesVuesaxBoldShoppingCart,
    inactiveIcon: Assets.imagesVuesaxOutlineShoppingCart,
  ),
  BottomNavigationBarEntity(
    title: 'حسابي ',
    activeIcon: Assets.imagesVuesaxBoldUser,
    inactiveIcon: Assets.imagesVuesaxOutlineUser,
  ),
];
