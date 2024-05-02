import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/Admin/home_admin/homeAdmin.dart';
import 'package:revive/modules/LoginAndReg/welcome_screen.dart';
import 'package:revive/modules/Owner/FactoryFootprint/questions_factory.dart';
import 'package:revive/modules/onBoarding/onBoarding.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
  DioHelper.init();
  bool? onBoarding = sharedPref.getData(key: "onBoarding");
  token = sharedPref.getData(key: "token");
  role = sharedPref.getData(key: "role");
  Widget? widget;

  if (onBoarding != null) {
    if (token != null && role == 2) {
      widget = QuestionsFactory();
    } else if(token != null && role == 3){
      widget = HomeLayout(index: 0,);
    }
    else if (token != null && role == 1) {
      widget = HomeAdmin();
    } else
      widget = WelcomeScreen();
  } else
    widget = OnBoarding();

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({
    super.key,
    this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: [
      //   AppLocale.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale("en",""),
      //   Locale("ar",""),
      // ],
      // localeResolutionCallback: (currentLang, supportLang) {
      //     if (currentLang != null) {
      //       for (Locale locale in supportLang) {
      //         if (locale.languageCode == currentLang.languageCode) {
      //           sharedPref.saveData(key: "lang",value:  currentLang.languageCode) ;
      //           return currentLang;
      //         }
      //       }
      //     }
      //     return supportLang.first;
      //   },
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
        backgroundColor: Color.fromRGBO(83, 233, 129, 1),
        splash: CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/logo1.png",
          ),
          backgroundColor: Color.fromRGBO(83, 233, 129, 1),
          radius: 90,
        ),
        splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        duration: 1000,
        nextScreen: startWidget!,
      ),
    );
  }
}
