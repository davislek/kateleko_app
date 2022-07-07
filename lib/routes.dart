import 'package:flutter/widgets.dart';
import 'package:katale_ko_client/screens/cart/cart_screen.dart';
import 'package:katale_ko_client/screens/complete_profile/complete_profile_screen.dart';
import 'package:katale_ko_client/screens/details/details_screen.dart';
import 'package:katale_ko_client/screens/favourite/favourite_screen.dart';
import 'package:katale_ko_client/screens/forgot_password/forgot_password_screen.dart';
import 'package:katale_ko_client/screens/home/home_screen.dart';
import 'package:katale_ko_client/screens/login_success/login_success_screen.dart';
import 'package:katale_ko_client/screens/otp/otp_screen.dart';
import 'package:katale_ko_client/screens/profile/profile_screen.dart';
import 'package:katale_ko_client/screens/sign_in/sign_in_screen.dart';
import 'package:katale_ko_client/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FavouriteScreen.routeName: (context) => FavouriteScreen(),
};
