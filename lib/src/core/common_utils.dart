
import 'package:flutter/material.dart';

class CommonUtils{

  static Widget getAssetImage(String name,{String ext = "png"}){
    return Image.asset("assets/images/$name.$ext",fit: BoxFit.contain,width: 50,height: 50,);
 }
}