import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 130, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SEASONS',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SeasonCard(
                      country: 'FRANCE',
                      season: 'Winter',
                      seasonIndex: 0,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: SeasonCard(
                      country: 'CAMBODIA',
                      season: 'Summer',
                      seasonIndex: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({
    super.key,
    required this.country,
    required this.season,
    required this.seasonIndex,
  });

  final String country;
  final String season;
  final int seasonIndex;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late int currentSeasonIndex;

  final List<String> seasons = ['Winter', 'Summer', 'Autumn', 'Spring'];
  final Map<String, Color> seasonColors = {
    'Winter': const Color(0xFF87CEEB),
    'Summer': const Color(0xFFFFFF00),
    'Autumn': const Color(0xFFFF8C00),
    'Spring': const Color(0xFF90EE90),
  };

  @override
  void initState() {
    super.initState();
    currentSeasonIndex = widget.seasonIndex;
  }

  String get currentSeason => seasons[currentSeasonIndex];

  Color get backgroundColor => seasonColors[currentSeason] ?? Colors.grey;

  void nextSeason() {
    setState(() {
      currentSeasonIndex = (currentSeasonIndex + 1) % seasons.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextSeason,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: backgroundColor,
                  ),
                  child: Center(child: SeasonIcon(season: currentSeason)),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Text(
                  widget.country,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonIcon extends StatelessWidget {
  const SeasonIcon({super.key, required this.season});

  final String season;

  @override
  Widget build(BuildContext context) {
    switch (season) {
      case 'Winter':
        return Icon(Icons.ac_unit, size: 60, color: Colors.white);
      case 'Summer':
        return Icon(Icons.wb_sunny, size: 60, color: Colors.white);
      case 'Autumn':
        return Icon(Icons.nature, size: 60, color: Colors.white);
      case 'Spring':
        return Icon(Icons.favorite, size: 60, color: Colors.white);
      default:
        return SizedBox();
    }
  }
}
