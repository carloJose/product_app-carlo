import 'package:flutter/cupertino.dart';

class DataOrder{

  String name;
  double value;
  int id;
  String image;
  int status;
  String date;
  var products = [];

  DataOrder({this.name,this.value,this.id,this.image,this.status,this.date,this.products});
                          
}