import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 260, vertical: 60),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade400, width: 3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'SEASONS',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: SeasonCard(country: 'FRANCE', seasonIndex: 0),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: SeasonCard(country: 'CAMBODIA', seasonIndex: 2),
                      ),
                    ],
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

class SeasonCard extends StatefulWidget {
  SeasonCard({super.key, required this.country, required this.seasonIndex});

  final String country;
  final int seasonIndex;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late int currentSeasonIndex;
  final List<String> seasons = ['Winter', 'Spring', 'Summer', 'Autumn'];

  @override
  void initState() {
    super.initState();
    currentSeasonIndex = widget.seasonIndex;
  }

  String get currentSeason => seasons[currentSeasonIndex];

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
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              flex: 85,
              child: Image.asset(
                _getImagePath(currentSeason),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 15,
              child: Center(
                child: Text(
                  widget.country,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getImagePath(String season) {
    switch (season) {
      case 'Winter':
        return 'assets/images/winter.png';
      case 'Spring':
        return 'assets/images/spring.png';
      case 'Summer':
        return 'assets/images/summer.png';
      case 'Autumn':
        return 'assets/images/autumn.png';
      default:
        return 'assets/images/winter.png';
    }
  }
}
