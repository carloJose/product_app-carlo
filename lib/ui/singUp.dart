import 'package:brownie_app/data/data_provider.dart';
import 'package:brownie_app/widgets/buttons.dart';
import 'package:brownie_app/widgets/textFilds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:brownie_app/ui/profile.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:brownie_app/data/Data.dart';
import 'package:geocoder/geocoder.dart';

class SingUp extends StatefulWidget{
  @override
  _SingUpState createState() => _SingUpState();

}

class _SingUpState extends State<SingUp>{
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passWordController = new TextEditingController();
  final TextEditingController _passWordConfirmationController = new TextEditingController();
  final TextEditingController _companyController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _mailController = new TextEditingController();
  final TextEditingController _companyAdressController = new TextEditingController();
  final TextEditingController _cnpjController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    DataProvider myData = Provider.of<DataProvider>(context);

    List listFields = [_nameController.text,
      _passWordController.text,
      _passWordConfirmationController.text,
      _companyController.text,
      _phoneController.text,
      _mailController.text,
      _companyAdressController.text,
      _cnpjController.text];

    Widget checkAndNavi(){
      // it will be a api verification
      bool isOk = true;

      if (isOk == true){
          
        
        return buttonbol_general_button("Finalizar", () async {
          
          Vibration.vibrate(amplitude: 170,duration: 50);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));

          Data data = Data(name: _nameController.text,
                            company: _companyController.text,
                            phone: _phoneController.text,
                            email: _mailController.text,
                            address: _companyAdressController.text,
                            CNPJ: _cnpjController.text
                            );

          
        
          myData.setData(data);

        });
      }
    }




    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 20.0, top: 30),
              child: Column(
                children: <Widget>[
                  Text("Preencha todos os campos"),
                  genericField("Nome completo",_nameController ,Icons.person,false),
                  genericField("Senha",_passWordController,Icons.vpn_key,true),
                  genericField("Confirmar senha",_passWordConfirmationController,Icons.vpn_key,true),
                  genericField("Empresa",_companyController,Icons.account_balance,false),
                  genericFieldNumber("Telefone",_phoneController,Icons.phone,false),
                  genericField("Email",_mailController,Icons.mail,false),
                  genericField("Endereço comercial",_companyAdressController,Icons.location_on,false),
                  genericFieldNumber("CNPJ",_cnpjController,Icons.location_city,false)

                ],
              ),
            )
          ,
          Center(
              child: Padding(padding: EdgeInsets.only(top: 70,left: 0, bottom: 8),
                child: checkAndNavi()
              )

          )

        ],
      )


    );
  }

}


