//Demo TimeZone for Testing
class TimeZones {
  final String continent;
  final List<TimeZones> tiles;
  bool isOpened;

  TimeZones(
      {required this.continent, this.tiles = const [], this.isOpened = false});
}

//Supplying data for test
final timing = <TimeZones>[
  TimeZones(continent: 'Continents', tiles: [
    TimeZones(continent: 'Africa'),
    TimeZones(continent: 'Asia'),
    TimeZones(continent: 'Europe'),
    TimeZones(continent: 'North America'),
    TimeZones(continent: 'South America'),
  ]),
  TimeZones(
    continent: 'Time Zones',
    tiles: [
      TimeZones(continent: 'GMT + 1'),
      TimeZones(continent: 'GMT + 2'),
      TimeZones(continent: 'GMT + 3'),
      TimeZones(continent: 'GMT + 4'),
      TimeZones(continent: 'GMT + 5'),
    ],
  )
];
