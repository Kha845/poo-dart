import 'dart:math';

import 'package:dart_app/point/model/dart/Point.dart';
import 'package:dart_app/point/model/dart/shape.model.dart';

class Cercle extends Shape{
  Cercle({required Point p1,required Point p2}):
   super(p1:p1,p2:p2);

  double getRadius(){
    double radius=p1.distanceTo(p2);
    return radius;
  }
  @override
  double getArea() {
    double r=getRadius();
    return pi*r*r;
  }

  @override
  double getPerimetre() {
      return 2*pi*getRadius();
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'type':'Cercle',
      'center':p1.toJson(),
      'radius':getRadius()
    };
  }

}