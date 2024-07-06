import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_go_india_stocks/provider/city_provider.dart';

import '../model/city.dart';
import 'details_screen.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<City> _searchResults = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fetchPreviousCities();
    super.initState();
  }

  void _fetchPreviousCities() async {
    await Provider.of<CityProvider>(context, listen: false).getPreviousCities();
  }

  void _searchCities(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults.clear();
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<CityProvider>(context, listen: false).searchCity(query);
      // List<City> cities = await _cityService.searchCities(query.trim());
      setState(() {
        _searchResults =
            Provider.of<CityProvider>(context, listen: false).cities!;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Failed to search cities. Please try again."),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            controller: _searchController,
                            onSubmitted: (value) {
                              _searchCities(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search Your City',
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            _searchCities(_searchController.text);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _searchResults.isEmpty
                  ? InkWell(
                      onTap: () {
                        _searchCities(_searchController.text);
                      },
                      child: const Icon(
                        Icons.search,
                        size: 120,
                        color: Color.fromARGB(71, 255, 255, 255),
                      ),
                    )
                  : const SizedBox(),
              _isLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        City city = _searchResults[index];
                        return ListTile(
                          title: Text(city.name),
                          subtitle: Text("${city.lat}, ${city.lon}"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsScreen(
                                  cityName: city.name,
                                  lat: city.lat,
                                  lon: city.lon,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Previous Searches"),
              ),
              Consumer<CityProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.previousCities.length,
                    itemBuilder: (context, index) {
                      City city = provider.previousCities[index];
                      return ListTile(
                        title: Text(city.name),
                        subtitle: Text("${city.lat}, ${city.lon}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(
                                cityName: city.name,
                                lat: city.lat,
                                lon: city.lon,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
