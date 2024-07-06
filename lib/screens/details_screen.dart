import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_go_india_stocks/provider/weather_provider.dart';
import 'package:weather_app_go_india_stocks/widgets/weather_card.dart';

import '../model/weather.dart';
import '../widgets/footer_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String cityName;
  final double lat;
  final double lon;

  const DetailsScreen({
    super.key,
    required this.cityName,
    required this.lat,
    required this.lon,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<void> _onRefresh() {
    return Future.delayed(
      Duration.zero,
      () {
        Provider.of<WeatherProvider>(context, listen: false).fetchWeather(
          widget.lat,
          widget.lon,
        );
      },
    );
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
          widget.cityName,
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
              child: Consumer<WeatherProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const CircularProgressIndicator();
                  } else if (provider.weather == null) {
                    provider.fetchWeather(widget.lat, widget.lon);
                  }
                  CurrentWeather currentWeather = provider.weather!.current!;
                  List<WeatherCondition> conditions =
                      currentWeather.weather ?? [];

                  return Column(
                    children: [
                      WeatherCard(
                        cityName: widget.cityName,
                        weahterProvider: provider,
                        conditions: conditions,
                        currentWeather: currentWeather,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
