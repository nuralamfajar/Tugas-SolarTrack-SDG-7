import 'package:flutter/material.dart';
import 'pages/solar_home_page.dart';

void main() {
  runApp(const SolarTrackApp());
}

class SolarTrackApp extends StatelessWidget {
  const SolarTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SolarTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
        ),
        useMaterial3: true,
      ),
      home: const SolarHomePage(),
    );
  }
}
