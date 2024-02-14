import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revive/modules/login_screen/login.dart';
import 'package:revive/modules/onBoarding/onBoarding.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        primarySwatch: Colors.green,
        // scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[100],
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
            color: Colors.black,
          ),
        ),
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Color.fromRGBO(83,233,129,1),
        splash:  CircleAvatar(
        backgroundImage: AssetImage("assets/images/logo1.png",),
        backgroundColor: Color.fromRGBO(83,233,129,1),
        radius: 90,
        ),
        splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        duration: 1000,
        nextScreen: onBoarding(),
        ),
    );
  }
}
