import 'package:flutter/material.dart';

textFieldName(name, border) {
  if (!border) {
    return TextFormField(
//      validator: (name){
//        if (name.isEmpty) {
//          return "Escreva algum valor";
//        }
//      },
      controller: name,
      decoration: InputDecoration(
        //dica do conteudo do campo
          hintText: "Nome",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none
          ),
          icon: Icon(Icons.person), focusColor: Colors.yellow
      ),
    );
  }else{
    return TextField(
      controller: name,
      decoration: InputDecoration(
        //dica do conteudo do campo
          hintText: "Nome",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          icon: Icon(Icons.person), focusColor: Colors.yellow
      ),
    );
  }

}

passWord(controller,border) {
  if (!border){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        //dica do conteudo do campo
          hintText: "Senha",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none
          ),
          icon: Icon(Icons.vpn_key), focusColor: Colors.deepOrange
      ),
      obscureText: true,
    );
  }else{
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        //dica do conteudo do campo
          hintText: "Senha",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          icon: Icon(Icons.vpn_key), focusColor: Colors.deepOrange
      ),
      obscureText: true,
    );
  }

}


Widget genericField(String name,TextEditingController controller,IconData icon, bool isOcult){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none
        ),
        icon: Icon(icon)
    ),
    obscureText: isOcult,
  );
}

genericFieldNumber(name,controller,icon,isOcult){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none
        ),
        icon: Icon(icon)
    ),
    obscureText: isOcult,
    keyboardType: TextInputType.number,
  );
}