# Weather App

A Flutter weather application that fetches weather data from the OpenWeather API using Dio.

## Features

- Search for cities to get current weather data
- Display previously searched cities
- Save and retrieve previously searched cities using SharedPreferences
- Display weather details for a specific city in the `DetailsScreen`

## Screens

- **HomeScreen**: The main screen displaying the current weather and previously searched cities.
- **SearchScreen**: A screen that allows the user to search for cities.
- **DetailsScreen**: A screen that displays detailed weather information for a selected city.

|      HomeScreen     |     SearchScreen    |    DetailsScreen    |
| ------------------- | ------------------- | ------------------- | 
| ![1720287695751_100](https://github.com/adityapandeyz/weather_app/assets/40023090/6241a3ea-710b-48c4-a5f7-ac7c20a2976a) | ![1720287731403_100](https://github.com/adityapandeyz/weather_app/assets/40023090/68bab7c4-a250-4615-9bb7-7e5c28cf8009) | ![1720287672375_100](https://github.com/adityapandeyz/weather_app/assets/40023090/29594b8e-268b-49cd-9a77-f4d2964cce9d) | 

## Providers

- **CityProvider**: Manages city search results and stores previously searched cities.
- **WeatherProvider**: Manages weather data fetching and storage.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart: [Install Dart](https://dart.dev/get-dart)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/weather_app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd weather_app
    ```

3. Get the dependencies:

    ```bash
    flutter pub get
    ```

### Running the App

1. Connect your device or start an emulator.
2. Run the app:

    ```bash
    flutter run
    ```

## Usage

1. On the `HomeScreen`, you can view the current weather and a list of previously searched cities.
2. Navigate to the `SearchScreen` by tapping the search icon.
3. On the `SearchScreen`, enter a city name to search for weather data.
4. Select a city from the search results to view detailed weather information on the `DetailsScreen`.

## Dependencies

- [Dio](https://pub.dev/packages/dio): For making HTTP requests.
- [Provider](https://pub.dev/packages/provider): For state management.
- [SharedPreferences](https://pub.dev/packages/shared_preferences): For storing previously searched cities.

## API Key

This project uses the OpenWeather API. You need to replace `YOUR_API_KEY` in the `CityService` class with your actual OpenWeather API key.

```dart
final String _apiKey = "YOUR_API_KEY";
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


Make sure to replace `YOUR_API_KEY` with your actual OpenWeather API key and the GitHub repository URL with the actual URL of your repository.

