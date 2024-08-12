import 'package:bmi_calculator_001/config/Shared.dart';
import 'package:bmi_calculator_001/config/appLocal.dart';
import 'package:bmi_calculator_001/provider/provider.dart';
import 'package:bmi_calculator_001/routes.dart';
import 'package:bmi_calculator_001/screens/HomeScreen/HomeScreen.dart';
import 'package:bmi_calculator_001/screens/SplashScreen/components/IntroScreen.dart';
import 'package:bmi_calculator_001/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderManager(),
      child: MaterialAppChanger(),
    );
  }
}

class MaterialAppChanger extends StatefulWidget {
  const MaterialAppChanger({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MaterialAppChangerState state =
        context.findAncestorStateOfType<_MaterialAppChangerState>();
    state.setLocale(newLocale);
  }

  @override
  _MaterialAppChangerState createState() => _MaterialAppChangerState();
}

class _MaterialAppChangerState extends State<MaterialAppChanger> {
  String _page;
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    await getStringValue('lang').then((locale) {
      setState(() {
        this._locale = (locale == null) ? Locale('en', '') : Locale(locale, '');
      });
    });
    await getIntValue('intro').then((v) {
      setState(() {
        this._page = (v == 1) ? HomeScreen.routeName : IntroScreen.routeName;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    getStringValue('lang').then((locale) {
      setState(() {
        this._locale = (locale == null) ? Locale('en', '') : Locale(locale, '');
      });
    });
    getIntValue('intro').then((v) {
      setState(() {
        this._page = (v == 1) ? HomeScreen.routeName : IntroScreen.routeName;
      });
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (this._locale == null)
    //   return Center(child: CircularProgressIndicator());
    // else
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: theme(),
      home: HomeScreen(),
      routes: routes,
      initialRoute: _page,
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale("en", ""),
        Locale("ar", ""),
        Locale("fr", ""),
      ],
      locale: _locale,
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
    );
  }
}
