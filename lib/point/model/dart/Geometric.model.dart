import 'dart:convert';
import 'dart:io';
import 'dart:js_util/js_util_wasm.dart';

import 'package:dart_app/point/model/dart/Point.dart';
import 'package:dart_app/point/model/dart/Rectangle.model.dart';
import 'package:dart_app/point/model/dart/shape.model.dart';

import 'Cercle.model.dart';

class GeometricDesign {
  List<Shape> shapes=[];
  Shape add(Shape shape){
    shapes.add(shape);
    return shape;
  }
  void show(){
    for(Shape shape in shapes){
      if(shape is Cercle){
        print("***************circle************");
        print("Radius: ${shape.getRadius()}");
      }else if (shape is Rectangle){
        print("************Rectangle********");
        print("Height: ${shape.getHeight()}");
        print("Height: ${shape.getWidth()}");
      }
      print(shape.toJson());
      print("Area: ${shape.getArea()}");
      print("Perimetre: ${shape.getPerimetre()}");
    }
  }
 String toJson(){
    JsonEncoder jsonEncoder= const JsonEncoder.withIndent(" ");
    return jsonEncoder.convert({'shapes':shapes});
  }


  void save(String fileName){
    File file=File(fileName);
    file.writeAsStringSync(toJson());
  }
  GeometricDesign.fromFile(String fileName){
    File file=File(fileName);
    String data=file.readAsStringSync();
    Map<String,dynamic> jsonData=json.decode(data);
    List<Shape> shapesList=(jsonData['shapes'] as List).map((item){
      if(item['type']=='cercle'){
          double radius=double.parse(item['radius']);
          Point centre=Point.fromJson(item['center']);
          return Cercle(p1:centre,p2: Point(x:centre.x+radius,y: centre.y));
      }else{
        double w=item['width'];
        double h=item['height'];
        Point p1=Point(x: item['x'],y: item['y']);
        Point p2=Point(x: p1.x+w,y: p1.y+h);
        return Rectangle(p1: p1, p2: p2);
      }
    }).toList();
    shapes = shapesList;
  }
}