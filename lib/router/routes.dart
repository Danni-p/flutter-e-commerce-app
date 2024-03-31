import 'package:flutter_e_commerce_app/features/authentication/bindings/forget_password_bindings.dart';
import 'package:flutter_e_commerce_app/features/authentication/bindings/login_bindings.dart';
import 'package:flutter_e_commerce_app/features/authentication/bindings/new_password_bindings.dart';
import 'package:flutter_e_commerce_app/features/authentication/bindings/on_boarding_bindings.dart';
import 'package:flutter_e_commerce_app/features/authentication/bindings/signup_bindings.dart';
import 'package:flutter_e_commerce_app/features/authentication/bindings/verify_email_bindings.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/forget-password/forget_password_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/forget-password/new_password_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/on-boarding/on_boarding_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:flutter_e_commerce_app/features/authentication/screens/success/success_screen.dart';
import 'package:flutter_e_commerce_app/features/navigation-menu/bindings/navigation_menu_bindings.dart';
import 'package:flutter_e_commerce_app/features/personalization/bindings/change_full_name_bindings.dart';
import 'package:flutter_e_commerce_app/features/personalization/bindings/profile_bindings.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/address/user_address_screen.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/profile/change_full_name_screen.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce_app/features/personalization/screens/settings/settings_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/all-products/all_products_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/brand/all_brands_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/brand/brand_products_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/checkout/checkout_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/home/home_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/order/order_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-details/product_details_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product-reviews/product_reviews_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/store/store_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/sub-categories/sub_categories_screen.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:flutter_e_commerce_app/features/navigation-menu/navigation_menu.dart';
import 'package:get/get.dart';

class Routes {
  static String navigationMenu = '/navigation-menu';
  // authentcation
  static String forgetPassword = '/forget-password';
  static String newPassword = '/new-password';
  static String login = '/login';
  static String onBoarding = '/on-boarding';
  static String signup = '/signup';
  static String verifyEmail = '/verify-email';
  static String success = '/success';
  // personalization
  static String addNewAddress = '/add-new-address';
  static String userAddress = '/user-address';
  static String profile = '/profile';
  static String changeFullName = '/change-full-name';
  static String settings = '/settings';
  // shop
  static String allProducts = '/all-products';
  static String allBrands = '/all-brands';
  static String brandProducts = '/brand-products';
  static String cart = '/cart';
  static String checkout = '/checkout';
  static String home = '/home';
  static String order = '/order';
  static String productDetails = '/product-details';
  static String productReviews = '/product-reviews';
  static String store = '/store';
  static String subCategories = '/sub-categories';
  static String wishlist = '/wishlist';
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
      name: Routes.navigationMenu,
      page: () => const NavigationMenu(),
      binding: NavigationMenuBindings()),
  // authentication
  GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBindings()),
  GetPage(
      name: Routes.newPassword,
      page: () => const NewPasswordScreen(),
      binding: NewPasswordBindings()),
  GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings()),
  GetPage(
      name: Routes.onBoarding,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBindings()),
  GetPage(
      name: Routes.signup,
      page: () => const SignupScreen(),
      binding: SignupBindings()),
  GetPage(
      name: Routes.verifyEmail,
      page: () => const VerifyEmailScreen(),
      binding: VerifyEmailBindings()),
  GetPage(name: Routes.success, page: () => const SuccessScreen()),
  // personalization
  GetPage(name: Routes.addNewAddress, page: () => const AddNewAddressScreen()),
  GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
  GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBindings()),
  GetPage(
      name: Routes.changeFullName,
      page: () => const ChangeFullNameScreen(),
      binding: ChangeFullNameBindings()),
  GetPage(name: Routes.settings, page: () => const SettingsScreen()),
  // shop
  GetPage(name: Routes.allProducts, page: () => const AllProductsScreen()),
  GetPage(name: Routes.allBrands, page: () => const AllBrandsScreen()),
  GetPage(name: Routes.brandProducts, page: () => const BrandProductsScreen()),
  GetPage(name: Routes.cart, page: () => const CartScreen()),
  GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.order, page: () => const OrderScreen()),
  GetPage(
      name: Routes.productDetails, page: () => const ProductDetailsScreen()),
  GetPage(
      name: Routes.productReviews, page: () => const ProductReviewsScreen()),
  GetPage(name: Routes.store, page: () => const StoreScreen()),
  GetPage(name: Routes.subCategories, page: () => const SubCategoriesScreen()),
  GetPage(name: Routes.wishlist, page: () => const WishlistScreen())
];
