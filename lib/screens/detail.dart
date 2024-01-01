import 'package:flutter/material.dart';
import 'package:real_estate_ui_challenge/model/house.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  House? house;
  DetailScreen({this.house, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}