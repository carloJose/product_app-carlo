import 'package:brownie_app/data/Data.dart';
import 'package:brownie_app/data/data_order.dart';
import 'package:brownie_app/data/data_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {

  Data _data;
  DataOrder _dataProduct;
  DataStore _dataStore;

  Data get data => _data;

  void setData(Data newData){
    _data = newData;
    notifyListeners();
  }

  DataOrder get dataOrder => _dataProduct;

  void setDataOrder( newProduct){
    DataOrder newOrder = DataOrder(date: TimeOfDay.now().toString(),name:"Pedido tal",id: 1,image:"assets\brownie_logo.png", status: 0,products: newProduct);
    _dataProduct = newOrder;
  }

  DataStore get dataStore => _dataStore;

  int get dataStoreProductsSaleNumber => _dataStore.numberProducts;

  void _startStore() => _dataStore = DataStore();

  void addDataStore(product){
    if(_dataStore == null){
      _startStore();
    }
    _dataStore.addProduct(product);
  }
}

