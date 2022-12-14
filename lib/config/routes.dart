import 'package:flutter/material.dart';
import 'package:shoeping/app/home/screens/brand_page/brand_page.dart';
import 'package:shoeping/app/home/screens/detail_brand_page/detail_brand_page.dart';
import 'package:shoeping/app/home/screens/product_page/product_page.dart';
import 'package:shoeping/app/home/screens/promo_page/promo_page.dart';
import '../app/home/screens/detail_promo_page/detail_promo_page.dart';
import '../app/splash/screens/splash_page.dart';
import '../shared/models/brand.dart';
import '../shared/models/product.dart';
import '../app/home/models/promo.dart';
import '../app/home/screens/search_page/search_page.dart';
import '../app/main/screens/main_page.dart';
import '../app/notification/screens/notification_page.dart';
import '../app/payment/screens/payment_method_page.dart';
import '../app/profile/screens/edit_profile_page.dart';
import '../app/profile/screens/my_address_page.dart';
import '../app/profile/screens/profile_page.dart';
import '../app/address/screens/add_address_page.dart';
import '../app/cart/screens/cart_page.dart';
import '../app/checkout/screens/checkout_page.dart';
import '../app/authentication/screens/confirm_pin_page.dart';
import '../app/authentication/screens/create_pin_page.dart';
import '../app/authentication/screens/reset_password_page.dart';
import '../app/authentication/screens/verified_page.dart';
import '../app/authentication/screens/verify_reset_password_page.dart';
import '../app/authentication/screens/verify_page.dart';
import '../app/authentication/screens/login_page.dart';
import '../app/authentication/screens/registration_page.dart';
import '../app/detail_product/screens/detail_product_page.dart';
import '../app/home/screens/home_page/home_page.dart';
import '../app/payment/screens/verify_pin_page.dart';
import '../app/wishlist/screens/wishlist_page.dart';
import '../config/route_name.dart';

final routes = {
  RouteName.splash: (context) => const SplashPage(),
  RouteName.registration: (context) => const RegistrationPage(),
  RouteName.login: (context) => const LoginPage(),
  RouteName.verify: (context) => const VerifyPage(),
  RouteName.verified: (context) => const VerifiedPage(),
  RouteName.createPin: (context) => const CreatePinPage(),
  RouteName.confirmPin: (context) => const ConfirmPinPage(),
  RouteName.verifyReset: (context) => const VerifyResetPasswordPage(),
  RouteName.resetPassword: (context) => const ResetPasswordPage(),
  RouteName.main: (context) => const MainPage(),
  RouteName.home: (context) => const HomePage(),
  RouteName.promo: (context) => const PromoPage(),
  RouteName.detailPromo: (context) => DetailPromoPage(
        promo: ModalRoute.of(context)!.settings.arguments as Promo,
      ),
  RouteName.brand: (context) => const BrandPage(),
  RouteName.detailBrand: (context) => DetailBrandPage(
        brand: ModalRoute.of(context)!.settings.arguments as Brand,
      ),
  RouteName.product: (context) => const ProductPage(),
  RouteName.detailProduct: (context) => DetailProductPage(
        product: ModalRoute.of(context)!.settings.arguments as Product,
      ),
  RouteName.cart: (context) => const CartPage(),
  RouteName.checkout: (context) => const CheckoutPage(),
  RouteName.addAddress: (context) => const AddAddressPage(),
  RouteName.paymentMethod: (context) => const PaymentMethodPage(),
  RouteName.verifyPin: (context) => const VerifyPinPage(),
  RouteName.homeSearch: (context) => const HomeSearchPage(),
  RouteName.wishlist: (context) => const WishlistPage(),
  RouteName.notification: (context) => const NotificationPage(),
  RouteName.profile: (context) => const ProfilePage(),
  RouteName.editProfile: (context) => const EditProfilePage(),
  RouteName.myAddress: (context) => const MyAddressPage(),
};
