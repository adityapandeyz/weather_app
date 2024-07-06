import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_go_india_stocks/provider/city_provider.dart';
import 'package:weather_app_go_india_stocks/provider/weather_provider.dart';
import 'package:weather_app_go_india_stocks/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CityProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          primarySwatch: Colors.blue,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            },
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
