import 'package:brownie_app/data/data_order.dart';
import 'package:brownie_app/data/data_provider.dart';
import 'package:brownie_app/ui/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


genericField(name, color){
  return Container(
    width: 350.0,
    height: 55.0,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: color,
            width: 3.0
        )
    ),
    child: Center(
      child: Text(name, style: TextStyle(
        fontSize: 18.0,
      ),),
    ),
  );
}

// olhar os items e ir mudando os item para pendente, caminhao e finalizado
//caminhao: local_shipping
// cancelado: thumb_down
// entregue: thumb_up
// em espera: thumbs_up_down
item(String text,double valor,int id,String image,int status,String data,List produtos,context){
  var satus_to_show = Icons.warning;
  Color statusTheme = Colors.orange;
  DataProvider myData = Provider.of<DataProvider>(context);

  if(status == 1){
    satus_to_show = Icons.local_shipping;
    statusTheme = Colors.grey;

  }else if(status == -1){
    satus_to_show = Icons.thumb_down;
    statusTheme = Colors.redAccent;

  }else if(status == 2){
    satus_to_show = Icons.thumb_up;
    statusTheme = Colors.green;
  }
  return GestureDetector(
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(15.0),
        color: statusTheme,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ) ,
          child: new ListTile(
            title: new Text(text),
            subtitle: new Text("Valor total: " +valor.toString()+"\nData: "+data.toString()),
            trailing: Icon(satus_to_show), onTap:(){
            print("produto: "+text);
            DataOrder dataProduct = DataOrder(name: text,
                                      value: valor,
                                      id: id,
                                      image: image,
                                      status: status,
                                      date: data,
                                      products: produtos);
            myData.setDataOrder(dataProduct);
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Order(id: id))
                                      );                
          },
            leading: new Image.asset(image,
              width: 150.0,
              height: 150.0,
            ),
          ),
        )
      )
  );
}

createListView(BuildContext context, List lista) {
  List values = lista;

  return new ListView.builder(
    itemCount: lista.length,
    itemBuilder: (BuildContext context, int index) {
      return new Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
            children: <Widget>[

              item(lista[index]["name"],
                  lista[index]["value"],
                  lista[index]["id"],
                  lista[index]["image"],
                  lista[index]["status"],
                  lista[index]["date"],
                  lista[index]["products"],
                  context
              ),
              new Divider(height: 10.0,),
            ],
          ),
      );
    },
  );
}
