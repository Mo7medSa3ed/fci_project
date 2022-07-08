import 'package:fci_project/bussniss_logic/auth_provider.dart';
import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:fci_project/bussniss_logic/order_provider.dart';
import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/bussniss_logic/store_provider.dart';
import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/user.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/presentation/screans/splash_screan/splash_screan.dart';
import 'package:fci_project/style/colors.dart';
import 'package:fci_project/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navKey = GlobalKey<NavigatorState>();
String assetImage = 'assets/images/logo.png';
String networkImage = 'https://cdn-icons-png.flaticon.com/512/831/831276.png';

late double kheight;
late double kweidth;
late double defultPadding = 16.0;
late double kpadding;
late double kdefaultTextSize = 15.0;
late double iconSize;
late bool isWeb;
late bool isAuth;
late String tok;
late User currantUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider<StoreProvider>(
          create: (_) => StoreProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (_) => OrderProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: LayoutBuilder(builder: (ctx, BoxConstraints boxConstraints) {
        initSizeUtilsForApp(boxConstraints);
        return GestureDetector(
          onTap: () => FocusScope.of(ctx).requestFocus(FocusNode()),
          child: MaterialApp(
            title: 'السوق اللإلكترونى',
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: kprimary,
              fontFamily: 'Changa',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              checkboxTheme: CheckboxThemeData(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: MaterialStateProperty.all(kprimary),
              ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: kprimary,
                primary: kprimary,
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TStyle.hintStyle,
                border: const UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: enableBorderColor, width: 2),
                ),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                  data: data.copyWith(textScaleFactor: 1),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: child!,
                  ));
            },
            home: SplashScrean(),
          ),
        );
      }),
    );
  }
}
