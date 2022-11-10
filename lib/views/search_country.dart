import 'package:flutter/material.dart';
import 'package:my_country/utils/responsive.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(),
    ));
  }
}
