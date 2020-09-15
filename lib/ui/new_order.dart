import 'package:brownie_app/data/data_provider.dart';
import 'package:brownie_app/ui/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:brownie_app/widgets/buttons.dart';

class GridViewListViewIndex extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    DataProvider myData = Provider.of<DataProvider>(context);

    final listOrders = [
                          {"name": "Pedido 1","value": 15.0,"id":1,"image":"assets/brownie_logo.png","status":-1,"date":"12/10/2019","products":[{"name":"ProdutoA", "qtd":70.0},{"name":"ProdutoB", "qtd":70.0}]},
                          {"name": "Pedido 2","value": 50.0,"id":2,"image":"assets/caixa_tradicional.jpeg","status":0,"date":"14/10/2019","products":[{"name":"ProdutoB", "qtd":70.0}]},
                          {"name": "Pedido 3","value": 100.0,"id":3,"image":"assets/presente_gosld.jpeg","status":1,"date":"15/10/2019","products":[{"name":"ProdutoC", "qtd":71230.0}]},
                          {"name": "Pedido 4","value": 150.0,"id":4,"image":"assets/presente_platina.jpeg","status":2,"date":"16/10/2019","products":[{"name":"ProdutoD", "qtd":70.0}]},
                          {"name": "Pedido 5","value": 15.0,"id":5,"image":"assets/presentr_fast.jpeg","status":-1,"date":"12/10/2019","products":[{"name":"ProdutoA", "qtd":70.0}]},
                          ];

    return Scaffold(
      appBar: AppBar(
                title: Text("Novo Pedido    "),
                backgroundColor: Colors.brown,
                actions: <Widget>[IconButton(icon: Icon(Icons.filter_list), onPressed: null)],
              ),
      body: Container(
        child: renderScrollArea(context,listOrders),
      ),
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.shopping_cart,),
        onPressed: () => {
          myData.setDataOrder(myData.dataStore),
          print(myData.dataOrder.toString()),
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Store())
                                      )
        },
        backgroundColor: Colors.brown,
        focusColor: Colors.brown[100],
        highlightElevation: 50,
        
      ),
      floatingActionButtonLocation:  FloatingActionButtonLocation.endFloat,
    );
  }

  List<Widget> businessLogic(BuildContext context, listOrders) {
    List<Widget> temp = [];
    // Constroi o numero de linhas do grid e 'e dividido por dois pq 
    // a lista fica dobrada " eu ainda tenho o que estudar o pq"
    // ai, dividindo por dois, fica o tamanho exato da lista de objetos
    for (var i = 0; i < listOrders.length/2; i++) {
      if (i % 6 == 1) {
        temp.add(renderGrids(context,listOrders));
      }
    }
    return temp;
  }

  Widget renderScrollArea(BuildContext context,listOrders) {
    final scrollableArea = CustomScrollView(
      slivers: businessLogic(context,listOrders),
    );
    return scrollableArea;
  }

  Widget renderGrids(BuildContext context, List lista) {

    final grids = SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // number of columns in grind
        crossAxisCount: 2,
      ),
      delegate: SliverChildListDelegate(
        [
          for (var i in lista) Padding(
            padding: const EdgeInsets.all(15.5),
            child: NewsFeed(context, i),
          )
        ],
      ),
    );
    return grids;
  }
}

Widget NewsFeed(BuildContext context, info) {
  DataProvider myData = Provider.of<DataProvider>(context);
  
  _onTapDown(TapDownDetails details, info) {
  Vibration.vibrate(amplitude: 170, duration: 50);
  var x = details.globalPosition.dx;
  var y = details.globalPosition.dy;
  print("tap down " + x.toString() + ", " + y.toString());
  print("Produto comprado: $info");
  myData.addDataStore(info);
  print("Produtos: "+myData.dataStore.toString());
  print(myData.dataStore.products.toString());
  }

  return GestureDetector(
        child: Container(
        decoration: BoxDecoration(
        boxShadow: [new BoxShadow(color: Colors.brown,blurRadius: 15.0,)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 0.5,
          color: Colors.brown
        )
    
      ),
      padding: EdgeInsets.all(2.0),
      child: Tab(
          child: Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                  color: Colors.brown[200],
                  width: 2.0,
                )
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(info["name"]),
                  Text(r"R$ "+info["value"].toString())
                ],
              ),
            ),
          ),
          icon: new Image.asset(info["image"].toString(),width: 70,height: 70,),
          
        ),
    ),
    
    onTapDown:   (TapDownDetails details) => _onTapDown(details, info),
  );
}
