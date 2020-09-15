import 'package:brownie_app/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Order extends StatefulWidget{
  @override
  final int id;

  Order({@required this.id});
  _OrderState createState() =>_OrderState(id:this.id);

}

class _OrderState extends State<Order>
 with SingleTickerProviderStateMixin{
  final int id;

  _OrderState({@required this.id});


  @override
  Widget build(BuildContext context)  {

    DataProvider myData = Provider.of<DataProvider>(context);

    return  Scaffold(
              appBar: AppBar(
                title: Text("Pedido: "+ myData.dataOrder.name.toString()+
                  "\n"+r"Valor total: R$"+myData.dataOrder.value.toString()
                ),
                backgroundColor: Colors.brown,
                actions: <Widget>[IconButton(icon: Icon(Icons.filter_list), onPressed: null)],
              ),
              backgroundColor: Colors.white,
              body: Container(
                child: ListView.builder(
                  itemCount: myData.dataOrder.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                          children: <Widget>[

                            ListTile(title: Text(myData.dataOrder.products[index]["name"].toString()),
                            subtitle: Text("Quantidade comprada do produto: "+myData.dataOrder.products[index]["qtd"].toString()),
                            leading: ExcludeSemantics(
                              child: CircleAvatar(
                                child: new Image.asset(myData.dataOrder.image.toString()),
                              ),
                            ),
                            ),
                            new Divider(height: 30.0, thickness: 1,endIndent: 12,indent: 10,),
                            
                          ],
                          
                        ),
                    );
                  },
                ) 
              ),
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  height: 100,
                  child: Center(
                    child: Text("Valor total:\n"+r"R$"+myData.dataOrder.value.toString(), 
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                              fontStyle: FontStyle.italic,
                            ) ,),
                  ),
                ),
                color: Colors.white,
              ),
                
            );
  }

}








////
//createListView(context, listOrder),
//buttonbol_navigation("Novo pedido", null, context)