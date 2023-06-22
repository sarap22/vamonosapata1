import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vamonosapata/screens/principal.dart';
import '../widget/button.dart';
import 'animacion/entry_point.dart';
import 'package:http/http.dart' as http;

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,

  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late RiveAnimationController _btnAnimationController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Usuario",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "titulo",
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.manage_accounts_rounded, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10,left: 10),
                child: const Text(
                  "Clave",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "titulo",
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    singIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 79, 79, 9),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color.fromRGBO(255, 205, 163, 9),
                  ),
                  label: const Text("SIGN IN", style: TextStyle(fontFamily: "titulo", fontSize: 25)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void showCustomDialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 620,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 205, 163, 9),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Scaffold (
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: Stack (
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        children: [
                          const Text("SIGN IN/", style: TextStyle(fontFamily: "titulo", fontSize: 25)),
                          RichText(text: const TextSpan(
                              text: "  SIGN UP", style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "titulo",
                              fontSize: 25
                          )
                          ))
                        ],
                      ),
                    ),
                    const SignInForm(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const info()),
                              );
                            },
                            child: const Text(
                              'Olvidó su contraseña?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontFamily: "titulo"
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top:10, left: 20),
                            child: GestureDetector(
                              onTap: () {
                                selectBtn(
                                  context,
                                  onValue: (_) {
                                  },
                                );
                              },
                              child: const Text(
                                'Registrarme',
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  ).then(onValue);
}
class registerDuenio extends StatefulWidget {
  const registerDuenio({super.key});

  @override
  State<registerDuenio> createState() => _registerDuenioState();
}

class _registerDuenioState extends State<registerDuenio> {
  final _documento= TextEditingController();
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _telefono= TextEditingController();
  final _direccion= TextEditingController();
  final _correo= TextEditingController();
  final _userName= TextEditingController();
  final _clave = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<dynamic> datos=[];
  Future<void> consultaDatos(body) async{
    final url=Uri.parse('http://192.168.0.5/insertDuenio');
    final response = await http.post((url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      print('Dato enviado exitosamente a Django, datos: '+body);
    } else {
      print('Error al enviar el dato a Django. Código de estado: ${response.statusCode}'+body);
    }
  }

  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      final body = json.encode({
        "documento":_documento.text,
        "user":_userName.text,
        "nombre":_nombre.text,
        "apellido":_apellido.text,
        "tel":int.parse(_telefono.text),
        "direccion":_direccion.text,
        "correo":_correo.text,
        "clave":_clave.text,
        "rol":"dueño"
      });
      consultaDatos(body);
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
                children: [
                  Row(
                      children:[
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: const Text(
                                    "Documento",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 19
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _documento,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.perm_identity, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 50),
                                  child: const Text(
                                    "Nombre",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 19
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _nombre,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.drive_file_rename_outline_outlined, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                        )
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    child: const Text(
                                      "Apellido",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _apellido,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.app_settings_alt_sharp, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 55),
                                    child: const Text(
                                      "Teléfono",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _telefono,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.numbers, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 45),
                                    child: const Text(
                                      "Dirección",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _direccion,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.directions, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Correo electrónico",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 18
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _correo,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      else if(!value.contains("@")){
                                        return "Correo no válido";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.alternate_email, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Nombre de usuario",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 18
                                    ),
                                  ),

                                  TextFormField(
                                    controller: _userName,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.manage_accounts_rounded, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 90),
                                    child: const Text(
                                      "Clave",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _clave,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      else if(value.length<8){
                                        return "Ingrese + de 7 caracteres";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.password, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        singIn(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(239, 79, 79, 9),
                        minimumSize: const Size(230, 56),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        CupertinoIcons.arrow_right,
                        color: Color.fromRGBO(255, 205, 163, 9),
                      ),
                      label: const Text("SIGN UP", style: TextStyle(fontFamily: "titulo", fontSize: 20)),
                    ),
                  ),
                ])
        )
    );
  }
}

void registerDuenioContent(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
          child: SingleChildScrollView(
              child: Container(
                  height: 720,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(116, 199, 184, 9),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Scaffold (
                      backgroundColor: Colors.transparent,
                      resizeToAvoidBottomInset: false,
                      body:
                      Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left:25, top:80, bottom: 52),
                              child: Row(
                                children: [
                                  const Text("SIGN UP/", style: TextStyle(fontFamily: "titulo", fontSize: 25, color: Colors.white)),
                                  RichText(text: const TextSpan(
                                      text: "  SIGN IN", style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "titulo",
                                      fontSize: 25
                                  )
                                  ))
                                ],
                              ),
                            ),
                            const registerDuenio()

                          ])
                  )
              )
          )
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  ).then(onValue);
}

class registroPaseador extends StatefulWidget {
  const registroPaseador({Key? key}) : super(key: key);

  @override
  State<registroPaseador> createState() => _registroPaseadorState();
}

class _registroPaseadorState extends State<registroPaseador> {
  final _documento= TextEditingController();
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _telefono= TextEditingController();
  final _direccion= TextEditingController();
  final _correo= TextEditingController();
  final _edad= TextEditingController();
  final _ocupacion=TextEditingController();
  final _userName= TextEditingController();
  final _clave = TextEditingController();
  final _rol = "paseador";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
                children: [
                  Row(
                      children:[
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: const Text(
                                    "Documento",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 19
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _documento,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.perm_identity, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 50),
                                  child: const Text(
                                    "Nombre",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 19
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _nombre,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.drive_file_rename_outline_outlined, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                        )
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    child: const Text(
                                      "Apellido",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _apellido,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.app_settings_alt_sharp, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 55),
                                    child: const Text(
                                      "Teléfono",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _telefono,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.numbers, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 45),
                                    child: const Text(
                                      "Dirección",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _direccion,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.directions, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Correo electrónico",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 18
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _correo,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      else if(!value.contains("@")){
                                        return "Correo no válido";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.alternate_email, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 80),
                                    child:
                                    const Text(
                                      "Edad",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _edad,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.support_agent_sharp, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 35),
                                    child: const Text(
                                      "Ocupación",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _ocupacion,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.sensor_occupied, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Nombre de usuario",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 17
                                    ),
                                  ),

                                  TextFormField(
                                    controller: _userName,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.manage_accounts_rounded, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 90),
                                    child: const Text(
                                      "Clave",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _clave,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      else if(value.length<8){
                                        return "Ingrese + de 7 caracteres";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.password, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ]
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        singIn(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(239, 79, 79, 9),
                        minimumSize: const Size(230, 56),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        CupertinoIcons.arrow_right,
                        color: Color.fromRGBO(255, 205, 163, 9),
                      ),
                      label: const Text("SIGN UP", style: TextStyle(fontFamily: "titulo", fontSize: 20)),
                    ),
                  ),
                ])
        )
    );
  }
}
void registerPaseadorContent(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
          child: SingleChildScrollView(
              child: Container(
                  height: 800,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(116, 199, 184, 9),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Scaffold (
                      backgroundColor: Colors.transparent,
                      resizeToAvoidBottomInset: false,
                      body:
                      Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left:25, top:50, bottom: 30),
                              child: Row(
                                children: [
                                  const Text("SIGN UP/", style: TextStyle(fontFamily: "titulo", fontSize: 25, color: Colors.white)),
                                  RichText(text: const TextSpan(
                                      text: "  SIGN IN", style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "titulo",
                                      fontSize: 25
                                  )
                                  ))
                                ],
                              ),
                            ),
                            const registroPaseador()

                          ])
                  )
              )
          )
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  ).then(onValue);
}

class registerAdmin extends StatefulWidget {
  const registerAdmin({super.key});

  @override
  State<registerAdmin> createState() => _registerAdminState();
}

class _registerAdminState extends State<registerAdmin> {
  final _documento= TextEditingController();
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _correo= TextEditingController();
  final _userName= TextEditingController();
  final _clave = TextEditingController();
  final _userPaseador = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<dynamic> datos=[];
  Future<void> insertAdmin(body) async{
    final url=Uri.parse('http://192.168.0.5/insertAdmin');
    final response = await http.post((url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      print('Dato enviado exitosamente a Django, datos: '+body);
    } else {
      print('Error al enviar el dato a Django. Código de estado: ${response.statusCode}'+body);
    }
  }
  Future<void> insertPaseador(body) async{
    final url=Uri.parse('http://192.168.0.5/insertPaseador');
    final response = await http.post((url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      print('Dato enviado exitosamente a Django, datos: '+body);
    } else {
      print('Error al enviar el dato a Django. Código de estado: ${response.statusCode}'+body);
    }
  }
  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      final body = json.encode({
        "documento":_documento.text,
        "user":_userName.text,
        "nombre":_nombre.text,
        "apellido":_apellido.text,
        "correo":_correo.text,
        "clave":_clave.text,
        "rol":"administrador"
      });
      insertAdmin(body);

      final bodyPaseador = json.encode({
        "paseadorUser":_userPaseador.text,
        "documentoAdmin_id":_documento.text,
      });
      insertPaseador(bodyPaseador);
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
                children: [
                  Row(
                      children:[
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: const Text(
                                    "Documento",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 19
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _documento,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.perm_identity, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 50),
                                  child: const Text(
                                    "Nombre",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 19
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _nombre,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.drive_file_rename_outline_outlined, color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                        )
                      ]
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    child: const Text(
                                      "Apellido",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _apellido,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.app_settings_alt_sharp, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Correo electrónico",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "titulo",
                                        fontSize: 18
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _correo,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      else if(!value.contains("@")){
                                        return "Correo no válido";
                                      }
                                      return null;
                                    },

                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.alternate_email, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ]
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Row(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    child:const Text(
                                      "Nombre de usuario",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _userName,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.manage_accounts_rounded, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    child: const Text(
                                      "Clave",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                      controller: _clave,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "";
                                        }
                                        else if(value.length<8){
                                          return "Ingrese + de 7 caracteres";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.password, color: Colors.grey),
                                      ),
                                    ),
                                ],
                              )
                          ),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child:
                    Stack(
                        children:[
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: 170,
                                    margin: EdgeInsets.only(right: 30),
                                    child: const Text(
                                      "Nombre de usuario paseador",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "titulo",
                                          fontSize: 19
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 55),
                                    width: 170,
                                    child: TextFormField(
                                      controller: _userPaseador,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.numbers, color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 95, left: 100),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                singIn(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(239, 79, 79, 9),
                                minimumSize: const Size(230, 56),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    ),
                                   ),
                                  ),
                                    icon: const Icon(
                                      CupertinoIcons.arrow_right,
                                      color: Color.fromRGBO(255, 205, 163, 9),
                                    ),
                                    label: const Text("SIGN UP", style: TextStyle(fontFamily: "titulo", fontSize: 20)),
                                    ),
                                    ),
                              ]
                          ),

                )]
        )
        )
    );
  }
}

void registerAdminContent(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
          child: SingleChildScrollView(
              child: Container(
                  height: 630,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(116, 199, 184, 9),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Scaffold (
                      backgroundColor: Colors.transparent,
                      resizeToAvoidBottomInset: false,
                      body:
                      Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left:25, top:50, bottom: 40),
                              child: Row(
                                children: [
                                  const Text("SIGN UP/", style: TextStyle(fontFamily: "titulo", fontSize: 25, color: Colors.white)),
                                  RichText(text: const TextSpan(
                                      text: "  SIGN IN", style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "titulo",
                                      fontSize: 25
                                  )
                                  ))
                                ],
                              ),
                            ),
                            const registerAdmin()

                          ])
                  )
              )
          )
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  ).then(onValue);
}
