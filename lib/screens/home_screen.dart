import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/city.dart';
import '../model/weather.dart';
import '../provider/city_provider.dart';
import '../provider/weather_provider.dart';
import '../widgets/footer_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<City>? lastSearchedCity;
  Future<void> _onRefresh() async {
    return Future.delayed(Duration.zero, () async {
      _fetchPreviousCities();
      await Provider.of<WeatherProvider>(context, listen: false)
          .fetchWeather(33.1, 44.1);
    });
  }

  void _fetchPreviousCities() async {
    await Provider.of<CityProvider>(context, listen: false).getPreviousCities();
  }

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => _onRefresh(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Consumer<CityProvider>(
                builder: (context, cityProvider, child) {
                  if (cityProvider.isLoading) {
                    return const CircularProgressIndicator();
                  } else if (cityProvider.previousCities.isEmpty) {
                    return const Column(
                      children: [
                        Icon(
                          Icons.location_city_rounded,
                          size: 100,
                          color: Color.fromARGB(76, 255, 255, 255),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SearchBarWidget(),
                      ],
                    );
                  }

                  return Consumer<WeatherProvider>(
                    builder: (context, weahterProvider, child) {
                      if (weahterProvider.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (weahterProvider.weather == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      CurrentWeather currentWeather =
                          weahterProvider.weather!.current!;
                      List<WeatherCondition> conditions =
                          currentWeather.weather ?? [];

                      return Column(
                        children: [
                          const SearchBarWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          WeatherCard(
                            cityName: cityProvider.previousCities.last.name,
                            currentWeather: currentWeather,
                            conditions: conditions,
                            weahterProvider: weahterProvider,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const FooterWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
