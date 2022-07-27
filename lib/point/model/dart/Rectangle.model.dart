import 'package:dart_app/point/model/dart/shape.model.dart';

class Rectangle extends Shape{
  Rectangle({required super.p1, required super.p2});

  double getWidth(){
    return (p2.x-p1.x).abs();
  }
  double getHeight(){
    return (p2.y-p1.y).abs();
  }

  @override
  double getArea() {
    return getHeight()*getWidth();
  }

  @override
  double getPerimetre() {
   return 2*(getWidth()*getHeight());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type":"Rectangle",
      'x':p1.x,
      'y':p1.y,
      "width":getWidth(),
      "height":getHeight()
    };
  }

}