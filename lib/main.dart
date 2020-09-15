import 'package:flutter/material.dart';
import 'package:brownie_app/ui/Login_screen.dart';
import 'package:provider/provider.dart';
import 'package:brownie_app/ui/teste.dart';

import 'data/data_provider.dart';
void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider.value(
      value: DataProvider()
      ,
    )

  ],
  child:   MaterialApp(
  
    title: 'Title',
  
    home: Login(),
  
    ),
)
);
