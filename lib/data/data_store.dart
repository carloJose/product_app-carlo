class DataStore{
  List _products;

  DataStore(){
    _products = List();
  }

  void addProduct(product){
    _products.add(product);
  }

  List get products{
    return _products;
  }

  int get numberProducts { 
      if (_products.isEmpty || _products == null){
        return 0;
      }else{
        return _products.length;
      }
    }
}