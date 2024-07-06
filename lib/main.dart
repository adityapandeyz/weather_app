import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_go_india_stocks/provider/city_provider.dart';
import 'package:weather_app_go_india_stocks/provider/weather_provider.dart';
import 'package:weather_app_go_india_stocks/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
          primaryColor: Colors.grey,
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            // Body Small
            bodySmall: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),

            // Body Medium
            bodyMedium: GoogleFonts.jost(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),

            // Body Large
            bodyLarge: GoogleFonts.jost(
              fontSize: 20,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: GoogleFonts.jost(
              fontSize: 18,
            ),
            centerTitle: true,
          ),
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
