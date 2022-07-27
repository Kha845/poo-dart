import 'dart:ffi';
import 'dart:math';

class Point{
 final  double x;
 final  double y;
 const Point({required this.x ,required this.y});
 Point.fromArray(List<double> data):
    x = data[0], y=data[1];
 Point.fromJson(Map<String,dynamic> data):
     x=(data['x'] as num).toDouble(),y=(data['y'] as num).toDouble();
 double distanceTo(Point p){
   double w=x-p.x;
   double h=y-p.y;
   return sqrt(w*w+h*h);
 }
 Map<String,dynamic> toJson(){
  return {'x': x, 'y': y};
 }
 @override
  String toString() {
    // TODO: implement toString
    return "Point($x,$y)";
  }
}