import 'package:flutter/material.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    location.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
