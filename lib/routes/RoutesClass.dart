import 'package:bhk_buyer_app/binding/signUpBinding.dart';
import 'package:bhk_buyer_app/resources/commonDash.dart';
import 'package:bhk_buyer_app/screens/homepage_management/notifications.dart';
import 'package:bhk_buyer_app/screens/categories_management/brandlisting.dart';
import 'package:bhk_buyer_app/screens/categories_management/categoriesdetailslisting.dart';
import 'package:bhk_buyer_app/screens/categories_management/categorieslisting.dart';
import 'package:bhk_buyer_app/screens/categories_management/categoriesproductlisting.dart';
import 'package:bhk_buyer_app/screens/filtershop.dart';
import 'package:bhk_buyer_app/screens/orders_management/orderdetails.dart';
import 'package:bhk_buyer_app/screens/product_details_screen.dart';
import 'package:bhk_buyer_app/screens/profile_management/viewprofile.dart';
import 'package:bhk_buyer_app/screens/splashScreen.dart';
import 'package:bhk_buyer_app/screens/wishlist.dart';
import 'package:get/get.dart';

import '../binding/loginBinding.dart';
import '../screens/login_screen.dart';
import '../screens/otpScreen.dart';
import '../screens/registration_screen.dart';

class RoutesClass {
  //BR1
  static String splash = '/splash';
  static String dashboard = '/dashboard';
  static String signUp = '/signUp';
  static String forgotPassword = '/forgotPassword';
  static String login = '/login';
  static String verify = '/verify';
  static String filter = '/filter';
  static String categories = '/categories';
  static String brands = '/brands';
  static String categoriesdetails = '/categoriesdetails';
  static String categoriesproduct = '/categoriesproduct';
  static String wishlist = '/wishlist';
  static String shop = '/shop';
  static String cart = '/cart';
  static String order = '/order';
  static String orderdetails = '/orderdetails';
  static String profile = '/profile';
  static String viewprofile = '/viewprofile';
  static String notification = '/notification';
  static String productdetails = '/productdetails';

  //BR1
  static String gotoSplash() => splash;
  static String gotoDashboardScreen() => dashboard;
  static String gotoLoginScreen() => login;
  static String gotoForgotPassword() => forgotPassword;
  static String gotoSignUpScreen() => signUp;
  static String gotoVerifyScreen() => verify;
  static String gotoFilterScreen() => filter;
  static String gotoCategoriesScreen() => categories;
  static String gotoCategoriesdetailsScreen() => categoriesdetails;
  static String gotoCategoriesproductScreen() => categoriesproduct;
  static String gotoBrandScreen() => brands;
  static String gotoWishlistScreen() => wishlist;
  static String gotoShopScreen() => shop;
  static String gotoCartScreen() => cart;
  static String gotoOrderScreen() => order;
  static String gotoOrderdetailsScreen() => orderdetails;
  static String gotoProfileScreen() => profile;
  static String gotoViewProfileScreen() => viewprofile;
  static String gotoNotificationScreen() => notification;
  static String gotoProductDetailsScreen() => productdetails;

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
        name: login,
        page: () => LoginScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: LoginBinding()),
    GetPage(
      name: dashboard,
      page: () => CommonDash(index: 0),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
        name: signUp,
        page: () => RegistrationScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: SignupBinding()),
    GetPage(
      name: verify,
      page: () => Otpscreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: filter,
      page: () => FilterScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: categoriesdetails,
      page: () => Categories(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: brands,
      page: () => BrandListing(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: categoriesproduct,
      page: () => Categoriesproducts(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: categories,
      page: () => CategoriesListing(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: wishlist,
      page: () => WishlistPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: shop,
      page: () => CommonDash(index: 1),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: cart,
      page: () => CommonDash(index: 2),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: order,
      page: () => CommonDash(index: 3),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: orderdetails,
      page: () => OrderDetails(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: profile,
      page: () => CommonDash(index: 4),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: viewprofile,
      page: () => ViewProfilePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: notification,
      page: () => Notifications(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: productdetails,
      page: () => ProductDetailsPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}

class LoginBindings {}
