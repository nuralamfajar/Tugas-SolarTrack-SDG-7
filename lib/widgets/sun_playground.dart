import 'package:flutter/material.dart';

class SunPlayground extends StatefulWidget {
  final bool isOn;
  final Color panelColor;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const SunPlayground({
    super.key,
    required this.isOn,
    required this.panelColor,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  State<SunPlayground> createState() => _SunPlaygroundState();
}

class _SunPlaygroundState extends State<SunPlayground> {
  Offset _sunPosition = const Offset(40, 30);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.isOn
                  ? [const Color(0xFFFFF9C4), const Color(0xFF81D4FA)]
                  : [const Color(0xFF455A64), const Color(0xFF263238)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 70,
                child: Container(
                  color: widget.isOn
                      ? const Color(0xFF81C784)
                      : const Color(0xFF37474F),
                ),
              ),
              Positioned(
                left: 105,
                bottom: 20,
                child: GestureDetector(
                  onTap: widget.onTap,
                  onLongPress: widget.onLongPress,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 150,
                    height: 90,
                    decoration: BoxDecoration(
                      color: widget.panelColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: widget.isOn
                          ? [
                              BoxShadow(
                                color: widget.panelColor.withValues(alpha: 0.6),
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ]
                          : [],
                    ),
                    child: const Center(
                      child: Text(
                        'PANEL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: _sunPosition.dx,
                top: _sunPosition.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      _sunPosition += details.delta;
                      _sunPosition = Offset(
                        _sunPosition.dx.clamp(0.0, 240.0).toDouble(),
                        _sunPosition.dy.clamp(0.0, 195.0).toDouble(),
                      );
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isOn
                          ? const Color(0xFFFFD54F)
                          : Colors.blueGrey,
                      boxShadow: widget.isOn
                          ? [
                              BoxShadow(
                                color: Colors.yellow.withValues(alpha: 0.8),
                                blurRadius: 30,
                              ),
                            ]
                          : [],
                    ),
                    child: const Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Matahari: '
                    '(${_sunPosition.dx.toStringAsFixed(0)}, '
                    '${_sunPosition.dy.toStringAsFixed(0)})',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
