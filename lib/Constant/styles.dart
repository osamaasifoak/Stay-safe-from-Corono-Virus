import 'package:flutter/material.dart';

class Styles{
  static const linearGradient = LinearGradient(
                colors: [
                  const Color(0xFFc90300),
                  const Color(0xFFf50000),
                    ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp); 
}