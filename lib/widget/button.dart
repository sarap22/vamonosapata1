import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/animacion/components/side_bar.dart';
import '../screens/animacion/entry_point.dart';
import '../screens/principal.dart';



class bLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125, // Ancho del botón
      height: 50,
      margin: EdgeInsets.only(top: 10, right: 60),// Alto del botón
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
      ),
      child: ElevatedButton(onPressed:() {
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => login()),
      );
      },style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(239, 79, 79, 9)
      ),
        child: Center(
        child: Text(
         "Ingresar",
          style: TextStyle(
            color: Colors.white, // Color del texto
            fontFamily: "titulo",
            fontSize: 18
          ),
        ),
      ),
      ),
    );
  }
}

class validacion extends StatefulWidget {
  const validacion({Key? key});

  @override
  State<validacion> createState() => _validacionState();
}

class _validacionState extends State<validacion> {
  final _user = TextEditingController();
  final _clave = TextEditingController();
  bool _validateUser = false;
  bool _validateClave = false;

  @override
  void dispose() {
    _user.dispose();
    _clave.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.only(top:30),
            width: 300,
                //_formaLogin(),
                //Text("SING IN", style: TextStyle(fontSize: 18),),
            child: Column(
              children:[
                _userLabel(),
                _claveLabel(),
                _links(),
                _botonLogin()
                    ],
                  ),
                )
                //_claveLabel(),
                /*Container(
                  padding: const EdgeInsets.only(right: 25, top: 20),
                  alignment: Alignment.centerRight,
                  child: Text('Olvidó su contraseña?'),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 25, top: 20),
                  alignment: Alignment.centerRight,
                  child: Text('Registrarme'),
                ),*/
    );
  }

  Container _userLabel() {
    return Container(
        margin: EdgeInsets.only(bottom: 10, top:10),
        child: TextField(
          controller: _user,
          decoration: InputDecoration(
            labelStyle: TextStyle(
                fontFamily: "titulo"
            ),
            labelText: 'Usuario',
            errorText: _validateUser ? 'Por favor, ingrese su usuario.' : null,
            filled: true,
            fillColor: Color(0xffEBDCFA),
            prefixIcon: Icon(Icons.account_box_outlined, color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCDA3)),
                borderRadius: BorderRadius.circular(50)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
    );
  }

  Container _claveLabel() {
    return Container(
        margin: EdgeInsets.only(top:10,bottom: 10),
        child: TextField(
          controller: _clave,
          decoration: InputDecoration(
            labelText: 'Clave',
            labelStyle: TextStyle(
                fontFamily: "titulo"
            ),
            errorText: _validateClave ? 'Por favor, ingrese su clave.' : null,
            filled: true,
            fillColor: Color(0xffEBDCFA),
            prefixIcon: Icon(Icons.content_paste_off_sharp, color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEBDCFA)),
                borderRadius: BorderRadius.circular(50)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBDCFA)),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
    );
  }
  _links(){
    return Container(
      margin: EdgeInsets.only(left: 20, top: 25, bottom: 30),
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => info()),
              );
            },
            child: Text(
              'Olvidó su contraseña?',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontFamily: "titulo"
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10, left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => registrar()),
                );
              },
              child: Text(
                'Registrame',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontFamily: "titulo"
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container _botonLogin() {
    return Container(
        width: 170, // Ancho del botón
        height: 50,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
        ),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EntryPoint()),
              );
            setState(() {
              _user.text.isEmpty ? _validateUser = true : _validateUser = false;
              _clave.text.isEmpty ? _validateClave = true : _validateClave = false;
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(239, 79, 79, 9),
          ),
          child: Text('Iniciar sesión', style: TextStyle(
              color: Colors.white, // Color del texto
              fontFamily: "titulo",
              fontSize: 18
          ),),
        )
    );
  }
}
class registro extends StatefulWidget {
  const registro({Key? key}) : super(key: key);

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final _nombre= TextEditingController();
  bool _validateName = false;
  final _apellido= TextEditingController();
  bool _validateApell = false;
  final _numCel= TextEditingController();
  bool _validateCel = false;
  final _direccion= TextEditingController();
  bool _validateDir = false;
  final _userName= TextEditingController();
  bool _validateUserName = false;
  final _clave = TextEditingController();
  bool _validateClave = false;
  final _correo= TextEditingController();
  bool _validateCorreo = false;
  final _rol= TextEditingController();
  bool _validateRol = false;

  @override
  void dispose() {
    _nombre.dispose();
    _apellido.dispose();
    _numCel.dispose();
    _direccion.dispose();
    _userName.dispose();
    _clave.dispose();
    _correo.dispose();
    _rol.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top:20),
        width: 300,
        child: Column(
        children: [
          _nameLabel(),
          _apeLable(),
          _ceLable(),
          _dirLabel(),
          _correoLable(),
          _UserName(),
          _claveLable(),
          _rolLable(),
          _buttonRegistro(),
        ],
      ),
      )
    );
  }
  _nameLabel(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _nombre,
        decoration: InputDecoration(
          labelText: 'Nombre',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateName ?  'Por favor, ingrese su nombre.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.drive_file_rename_outline_outlined, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _apeLable(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _apellido,
        decoration: InputDecoration(
          labelText: 'Apellido',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateApell ?  'Por favor, ingrese su apellido.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.app_settings_alt_sharp, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _ceLable(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _numCel,
        decoration: InputDecoration(
          labelText: 'Número de celular',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateCel ?  'Por favor, ingrese su número.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.numbers, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _dirLabel(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _direccion,
        decoration: InputDecoration(
          labelText: 'Dirección',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateDir ?  'Por favor, ingrese su dirección.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.directions, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _UserName(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _userName,
        decoration: InputDecoration(
          labelText: 'Nombre de usuario',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateUserName ?  'Por favor, ingrese un nombre de usuario.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.manage_accounts_rounded, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _claveLable(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _clave,
        decoration: InputDecoration(
          labelText: 'Clave',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateClave ?  'Por favor, ingrese una clave.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.password, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _correoLable(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _correo,
        decoration: InputDecoration(
          labelText: 'Correo electrónico',
          labelStyle: TextStyle(
              fontFamily: "titulo"
          ),
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: "titulo"
          ),
          errorText: _validateCorreo ?  'Por favor, ingrese su correo.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.alternate_email, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _rolLable(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _rol,
        decoration: InputDecoration(
          labelText: 'Rol',
          hintText: 'Adiministrador/ Dueño/ Paseador',
          labelStyle: TextStyle(
              fontFamily: "titulo",
              fontSize: 14,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: "titulo"
          ),
          errorText: _validateRol ?  'Por favor, ingrese su rol.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.sensor_occupied, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
          );
  }
  _buttonRegistro(){
    return Container(
        width: 170, // Ancho del botón
        height: 50,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
        ),
        child: ElevatedButton(
          onPressed: () {
            String rol=_rol.text;
            switch (rol){
              case "administrador":
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => EntryPoint()),
                );
               break;
              case "dueño":
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntryPoint()),
                );
                break;
              case "paseador":
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => paseador(_nombre.text)),
                );
                break;

            }
            setState(() {
              _nombre.text.isEmpty ? _validateName = true : _validateName = false;
              _apellido.text.isEmpty ? _validateApell = true : _validateApell = false;
              _numCel.text.isEmpty ? _validateCel = true : _validateCel = false;
              _direccion.text.isEmpty ? _validateDir = true : _validateDir = false;
              _userName.text.isEmpty ? _validateUserName = true : _validateUserName = false;
              _clave.text.isEmpty ? _validateClave = true : _validateClave = false;
              _correo.text.isEmpty ? _validateCorreo = true : _validateCorreo = false;
              _rol.text.isEmpty ? _validateRol = true : _validateRol = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(239, 79, 79, 9),
          ),
          child: Text('Registrarme', style: TextStyle(
              color: Colors.white, // Color del texto
              fontFamily: "titulo",
              fontSize: 20
          ),),
        )
    );
  }
}

class pasValidate extends StatefulWidget {
  const pasValidate({Key? key}) : super(key: key);

  @override
  State<pasValidate> createState() => _pasValidateState();
}

class _pasValidateState extends State<pasValidate> {
  final _documento= TextEditingController();
  bool _validateDoc= false;
  final _edad= TextEditingController();
  bool _validateEdad= false;
  final _ocupacion= TextEditingController();
  bool _validateOc= false;
  @override
  void dispose() {
    _documento.dispose();
    _edad.dispose();
    _ocupacion.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          _docLabel(),
          _edadLabel(),
          _ocuLabel(),
          _buttonRegisterPaseador()
        ],
      ),
    );
  }
  _docLabel(){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _documento,
        decoration: InputDecoration(
          labelText: '# de documento',
          labelStyle: TextStyle(
            fontFamily: "titulo",
            fontSize: 14,
          ),
          hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: "titulo"
          ),
          errorText: _validateDoc ?  'Por favor, ingrese su documento.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.document_scanner_rounded, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
_edadLabel(){
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: TextField(
      controller: _edad,
      decoration: InputDecoration(
        labelText: 'Edad',
        labelStyle: TextStyle(
          fontFamily: "titulo",
          fontSize: 14,
        ),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: "titulo"
        ),
        errorText: _validateEdad ?  'Por favor, ingrese su edad.' : null,
        filled: true,
        fillColor: Color(0xffEBDCFA),
        prefixIcon: Icon(Icons.numbers, color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFCDA3)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );
}
  _ocuLabel(){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _ocupacion,
        decoration: InputDecoration(
          labelText: 'Ocupación',
          labelStyle: TextStyle(
            fontFamily: "titulo",
            fontSize: 14,
          ),
          hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: "titulo"
          ),
          errorText: _validateOc ?  'Por favor, ingrese su ocupación.' : null,
          filled: true,
          fillColor: Color(0xffEBDCFA),
          prefixIcon: Icon(Icons.sensor_occupied, color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCDA3)),
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDA3)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
  _buttonRegisterPaseador(){
    return Container(
        width: 170, // Ancho del botón
        height: 50,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _documento.text.isEmpty ? _validateDoc = true : _validateDoc = false;
              _edad.text.isEmpty ? _validateEdad = true : _validateEdad = false;
              _ocupacion.text.isEmpty ? _validateOc = true : _validateOc = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(239, 79, 79, 9),
          ),
          child: Text('Ser paseador', style: TextStyle(
              color: Colors.white, // Color del texto
              fontFamily: "titulo",
              fontSize: 20
          ),),
        )
    );
  }
}




