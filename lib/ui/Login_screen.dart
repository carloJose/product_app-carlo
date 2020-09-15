import 'package:brownie_app/data/Data.dart';
import 'package:brownie_app/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:brownie_app/widgets/textFilds.dart';
import 'package:brownie_app/widgets/buttons.dart';
import 'package:brownie_app/ui/singUp.dart';
import 'package:brownie_app/ui/profile.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:brownie_app/ui/Login_screen_msg_error.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passWordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();


  void _exibirDialogo() {
    //Login_msg_error
    Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Login_msg_error()));

  }

  nameButton(int typeBotton){
    if (typeBotton == 0) return "Cadastro";
    if (typeBotton == 1) return "Acesso";
  }

  styleTextButton(int typeBotton){
    if (typeBotton == 0) return TextStyle(color: Colors.brown,fontSize: 16);
    if (typeBotton == 1) return TextStyle(color: Colors.white,fontSize: 16);
  }

  styleButton(int typeBotton){
    if (typeBotton == 1) {
      return BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(15.0));
    }else{
       return BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0));
    }
  }

  buttonbol_navigation (int typeBotton) { //name,password
    // button get the graduate
    bool isOk = false;

    return GestureDetector(
        child: Container(
          //rmargin: const EdgeInsets.only(left: 130.0),
          width: 150.0,
          height: 55.0,
          decoration: styleButton(typeBotton),
          child:Center(
              child: Text(nameButton(typeBotton), style:  styleTextButton(typeBotton),)
          ),

        ), onTap: () {
      Vibration.vibrate(duration: 70, amplitude: 50);
      if (typeBotton == 0){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SingUp()
              )
            );
      }else if (typeBotton == 1){
        if (_passWordController.text == "" || _nameController.text  == null || _nameController.text == "" ){
        print("Nao tem");
        _exibirDialogo();
      }else{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Profile()
        ));

      }
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    DataProvider myData = Provider.of<DataProvider>(context);
    List lista_fields = [_nameController.text, _passWordController.text];

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            new Image.asset('assets/brownie_logo.png',
              width: 300.0,
              height: 300.0,
            ),
            Center(
                child:Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                        child:Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 40.0),
                          child: Column(
                            children: <Widget>[

                              textFieldName(_nameController, false),
                              Padding(padding: const EdgeInsets.only(top: 10.0)),
                              passWord(_passWordController, false),

                            ],
                          )
                      ) ,
                    ),

                    Padding(padding: const EdgeInsets.only(top: 70.0),
                      child:Column(
                        children: <Widget>[
                          buttonbol_navigation(1),
                          buttonbol_navigation(0)
                        ],
                      ) 
                    )
                  ],
                )
            )

          ],
        ),
      ),
    );
  }

}





