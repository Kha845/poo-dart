

import 'package:dart_app/point/model/dart/Point.dart';
abstract class Shape{
  final Point p1;
  final Point p2;
 const Shape({required this.p1,required this.p2});
 double getPerimetre();
 double getArea();
 Map<String,dynamic> toJson();
}