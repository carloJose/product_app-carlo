import 'package:brownie_app/data/data_provider.dart';
import 'package:brownie_app/ui/new_order.dart';
import 'package:brownie_app/widgets/buttons.dart';
import 'package:brownie_app/widgets/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:brownie_app/data/Data.dart';
import 'package:brownie_app/ui/orders.dart';
import 'package:brownie_app/ui/new_order.dart';
import 'package:provider/provider.dart';

import 'new_order.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() {
    return  _ProfileState();
  }

}

class _ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    DataProvider myData = Provider.of<DataProvider>(context);
    var COLORTHEME = Colors.brown;
    // TODO: implement build
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
          backgroundColor: Colors.brown,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Image.asset('assets/brownie_logo.png',
                  width: 150.0,
                  height: 150.0,
                ),

                Card(child:  Text("Nome"),),
                Padding(padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: genericField(myData.data.name, COLORTHEME)
                  ),
                Card(child:  Text("Empresa"),),
                Padding(padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: genericField(myData.data.company, COLORTHEME),
                ),
                Card(child:  Text("Endereço"),),
                Padding(padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: genericField(myData.data.address, COLORTHEME),
                ),
                Card(child:  Text("CNPJ"),),
                Padding(padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: genericField(myData.data.CNPJ, COLORTHEME),
                ),
                Card(child:  Text("Telefone"),),
                Padding(padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: genericField(myData.data.phone, COLORTHEME),
                ),
                Card(child:  Text("Email"),),
                Padding(padding: EdgeInsets.only(top: 1.0, bottom: 5),
                  child: genericField(myData.data.email, COLORTHEME),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0),
                  child: Padding(padding: EdgeInsets.only(left: 30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              
                              buttonbol_navigation("Pedidos",Orders(),context),
                              Padding(padding: EdgeInsets.all(3),),
                              buttonbol_navigation("Novo pedido", GridViewListViewIndex(), context),
        
                              
                            ],
                          ),
                        ),
                      ),
                    )
                  
                ),
              ]
            )
          ],
        )
  );
}

}