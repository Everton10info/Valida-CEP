import 'package:flutter/material.dart';
import 'package:validacep/data/db_service.dart';
import 'package:provider/provider.dart';
import 'package:validacep/data/http_service.dart';
import 'package:validacep/repository/repository.dart';
import 'package:validacep/view_models/view_model_search.dart';
import 'views/Splash_viewiew.dart';
import 'views/details_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ViewModelSearch(Repository(ServiceDB(), ServiceWeb())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final themeOption = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeOption,
        builder: (BuildContext context, ThemeMode value, child) {
          return MaterialApp(
            title: 'Valida Cep',
            debugShowCheckedModeBanner: false,
            themeMode: value,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: const Color.fromARGB(223, 243, 29, 29),
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(224, 194, 33, 33),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: const Color.fromARGB(244, 121, 8, 8),
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(223, 110, 23, 23),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashView(),
              HomeView.pageName: (context) => const HomeView(),
              DetailsView.pageName: (context) => const DetailsView(),
            },
          );
        });
  }
}
