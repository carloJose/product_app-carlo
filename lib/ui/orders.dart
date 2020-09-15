import 'package:brownie_app/data/data_order.dart';
import 'package:brownie_app/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:brownie_app/widgets/fields.dart';
import 'package:brownie_app/widgets/buttons.dart';
import 'package:brownie_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget{
  @override
  _OrdersState createState() => _OrdersState();

}

class _OrdersState extends State<Orders>{
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passWordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // comando que conecta as p'aginas com os meus dados
    DataProvider myData = Provider.of<DataProvider>(context);
    List lista_fields = [_nameController.text, _passWordController.text];
    final listOrders = myData.dataStore.products;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list), 
              onPressed:null
                    )
                  ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        alignment: Alignment.topCenter,
        child: createListView(context, listOrders),
      ),

    );
  }

}








////
//createListView(context, listOrders),
//buttonbol_navigation("Novo pedido", null, context)