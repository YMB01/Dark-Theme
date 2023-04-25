import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/const/themedata.dart';
import 'package:theme/screen/homepage.dart';
import 'package:theme/servises/dark_theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = DarkThemeProvider();
    void getCurrentTheme() async {
      themeProvider.setDarkTheme = await themeProvider.provider.getDarkTheme();
    }

    @override
    void initState() {
      super.initState();
      getCurrentTheme();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const HomePage(),
        );
      }),
    );
  }
}
