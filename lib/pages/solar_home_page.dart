import 'package:flutter/material.dart';

import '../widgets/header_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/sun_playground.dart';

class SolarHomePage extends StatefulWidget {
  const SolarHomePage({super.key});

  @override
  State<SolarHomePage> createState() => _SolarHomePageState();
}

class _SolarHomePageState extends State<SolarHomePage> {
  bool _isSolarOn = false;
  int _energyGenerated = 0;
  int _colorIndex = 0;

  static const List<Color> _panelColors = [
    Color(0xFF1565C0),
    Color(0xFFF9A825),
    Color(0xFF6A1B9A),
    Color(0xFF00897B),
  ];

  void _toggleSolar() {
    setState(() {
      _isSolarOn = !_isSolarOn;
      if (_isSolarOn) {
        _energyGenerated += 12;
      }
    });
  }

  void _cyclePanelColor() {
    setState(() {
      _colorIndex = (_colorIndex + 1) % _panelColors.length;
      _energyGenerated += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: const Text('SolarTrack · SDG 7'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderCard(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.bolt,
                    label: 'Energi',
                    value: '$_energyGenerated kWh',
                    color: Colors.amber.shade800,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    icon: Icons.wb_sunny,
                    label: 'Status',
                    value: _isSolarOn ? 'AKTIF' : 'MATI',
                    color: _isSolarOn ? Colors.green.shade700 : Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    icon: Icons.solar_power,
                    label: 'Panel',
                    value: '${_colorIndex + 1}/4',
                    color: _panelColors[_colorIndex],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SunPlayground(
              isOn: _isSolarOn,
              panelColor: _panelColors[_colorIndex],
              onTap: _toggleSolar,
              onLongPress: _cyclePanelColor,
            ),
            const SizedBox(height: 12),
            Card(
              color: const Color(0xFFE8F5E9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coba gesture berikut:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text('• Tap panel surya: nyalakan / matikan sistem'),
                    Text('• Long press panel: ganti warna panel (4 warna)'),
                    Text('• Drag matahari: pindahkan posisinya bebas'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
