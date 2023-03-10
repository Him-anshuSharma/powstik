import 'package:flutter/material.dart';
import 'package:powstik/provider/cart.dart';
import 'package:powstik/provider/filtered_products.dart';
import 'package:powstik/ui/screens/cart_screen.dart';
import 'package:powstik/ui/screens/checkout_screen.dart';
import 'package:powstik/ui/screens/home_screen.dart';
import 'package:powstik/ui/screens/home_screen_filtered_items.dart';
import 'package:powstik/ui/screens/sign_in.dart';
import 'package:powstik/ui/screens/sign_up.dart';
import 'package:powstik/ui/theme/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),
        ChangeNotifierProvider<FilteredProducts>(create: (context) => FilteredProducts()),
      ],
      child: MyApp(),
    ),
  );
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.signInScreen,
      routes: {
        SignInScreen.signInScreen: (context) => const SignInScreen(),
        SignUpScreen.signUpScreen: (context) => SignUpScreen(),
        HomeScreenState.HomeScreen: (context) => const HomeScreen(),
        CartScreen.cartScreen: (context) => CartScreen(),
        FilteredProductListScreen.filteredProductListScreen: (context) => const FilteredProductListScreen(),
        CheckoutScreen.checkoutScreen: (context) => const CheckoutScreen()
      },
    );
  }
}
