import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vamonosapata/screens/registros.dart';
import '../widget/button.dart';

class info extends StatefulWidget {
  const info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> with SingleTickerProviderStateMixin{

  final _controller = PageController(
      viewportFraction: 0.6
  );

  double _currenPage=0.0;

  void _listener(){
    setState(() {
      _currenPage= _controller.page!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }
  /*final particleOptions = ParticleOptions(
    image: Image.asset(
        "img/letraslogo_preview_rev_1.png"),
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 140,
  );*/
  @override
  Widget build(BuildContext context) {
    double _opacidad=0;
    String VMV= "Nuestros valores son: ""\n"" 🔹Honestidad ""\n"" 🔹Fiabilidad ""\n"" 🔹Amabilidad ""\n"" 🔹Respeto ""\n"" 🔹Integridad ""\n"" 🔹Atención ""\n"" 🔹Innovación ""\n"" 🔹Proactividad";

    String newVMV = VMV.replaceAll("|", "\n");

    unavezmas(int i, double opacidad) {
      final List<Widget> pageWidgets= [
         _page1(opacidad), _page2(opacidad), _page3(opacidad), _page4(newVMV, opacidad)
      ];
      return pageWidgets[i];
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            color: Color.fromRGBO(116, 199, 184, 9),
            /*AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: particleOptions
        ),
            behaviour: RacingLinesBehaviour(
            ),
        vsync: this, //para que indique que es animado*/
        child: PageView.builder(
            controller: _controller,
            itemCount: 4,
            itemBuilder: (_,i){
              //debugPrint( _currenPage.toString());
              if (i == _currenPage){
                _opacidad =1;
                return Transform.scale(
                    scale: 1.5,
                    child: unavezmas(i, _opacidad)
                  //_page1(_opacidad)
                  //_page1(textos,_opacidad)
                );}
              else if(i< _currenPage){
                _opacidad = max(1 - (_currenPage - i), 0.2);
                return Transform.scale(
                    scale: max(1.5 - (_currenPage - i), 1),
                    child: unavezmas(i, _opacidad)
                    //child: pageWidgets[i]
                  //_page1(textos,_opacidad)
                );
              }
              else{
                _opacidad = max(1 - ( i- _currenPage), 0.2);
                return Transform.scale(
                    scale: max(1.5 - ( i- _currenPage), 1),
                    child: unavezmas(i, _opacidad)
                    //child: pageWidgets[i]
                  //_page1(textos,_opacidad)
                );
              }
            }
        )
        )// )
    );
  }

  _page1(double _opacidad){
    return Center(
        child: Container(
            width: 200,
            height: 400,
            margin: EdgeInsets.only(left:20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_opacidad),
              borderRadius: BorderRadius.circular(25)
            ),
            child:
            Column(
                children:[
                  Stack(
                    children: [
                      Container(
                        child: Image.asset("img/fondoo1.png"),
                      ),
                        Column(
                          children: [
                            Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 20, top: 20),
                              child: Text('¡Te damos la bienvenda a VÁMONOS A PATA!, Un lugar  seguro, en el que puedes confiarnos tus mascotas perrunas para cuidarlas y pasearlas mientras tú estás ocupado.',
                                  style: TextStyle(fontFamily: 'titulo', fontSize: 17, color: Colors.black.withOpacity(_opacidad),)
                              ),
                            ),
                            Stack(
                                children:[
                                  bLogin(),
                                  Container(
                                    margin: EdgeInsets.only( top: 30),
                                    alignment: Alignment.topRight,
                                    child: Image.asset("img/logo-removebg-preview.png", width: 110),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 100, right: 40),
                                    child: Transform.rotate(
                                        angle: 0.3,
                                        child: Image.asset("img/letraslogo_preview_rev_1.png", width: 200)
                                    ),
                                  )
                              ],
                            )
                            ])
                          ],
                        ),
                ]),
                )
        );
  }
  _page2(double _opacidad){
    return Center(
            child: Container(
              width: 200,
              height: 400,
              margin: EdgeInsets.only(left:25, right: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_opacidad),
                borderRadius: BorderRadius.circular(25)
              ),
              child:
                Column(
                  children:[
                    Container(
                      margin: EdgeInsets.only(top:20),
                      child: Image.asset("img/logo.png", height: 150,),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:3),
                          child: Image.asset("img/formafondo1.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:28),
                          padding: EdgeInsets.only(top:20, left: 10),
                          child: Stack(
                                    children: [
                                      Container(
                                        width:160,
                                        child: Text('VÁMONOS A PATA brinda un apoyo indispensable al bienestar y educación de tus mascotas, ya que nuestros paseadores están capacitados no solo para pasear a tus perritos, sino también para entrenarlos y educarlos; de una manera paciente y cariñosa, reconociendo cada uno de sus logros.',
                                          style: TextStyle(fontFamily: 'titulo', fontSize: 12, color: Colors.black.withOpacity(_opacidad),),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                    ],
                                  )
                        )
                      ],
                    )
                  ])
                )
            );
  }
  _page3(double _opacidad){
    return Center(
        child: Container(
            width: 187,
            height: 400,
            margin: EdgeInsets.only(left:20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_opacidad),
                borderRadius: BorderRadius.circular(25),

            ),
            child:
                Stack(
                  children: [
                    Image.asset("img/formafondo2.png"),
                    Column(
                        children:[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top:40, right: 10),
                                        ),
                                        Container(
                                            width: 180,
                                            padding: EdgeInsets.only(top:10, bottom:10, left: 70, right: 5),
                                            child: Column(
                                              children: [
                                                Text('Vámonos a pata dispone de un equipo de paseadores bastante ámplio; ellos son parte de  “NUESTRA MANADA”, ya que tus perros no querrán despegarse de ellos.',
                                                  style: TextStyle(fontFamily: 'titulo', fontSize: 10, color: Colors.black.withOpacity(_opacidad),),
                                                  textAlign: TextAlign.right,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showCustomDialog(
                                                      context,
                                                      onValue: (_) {
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'Quiero conocer a la manada',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 10,
                                                        fontFamily: 'titulo',
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            )
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(bottom: 6, top: 10, left: 10),
                                    width: 187,
                                    child:Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 120,
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      showCustomDialog(
                                                        context,
                                                        onValue: (_) {
                                                        },
                                                      );
                                                    },
                                                    child :
                                                    Text(
                                                      'Paseadores por aquí...',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 14,
                                                          fontFamily: 'titulo'
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(top: 5),
                                                      child: Text('Encuentra paseadores cerca para que tu perrito no extrañe tanto su casa.',
                                                          style: TextStyle(fontFamily: 'titulo', fontSize: 12, color: Colors.black.withOpacity(_opacidad),)
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Container(
                                              margin: EdgeInsets.only(left: 70),
                                              child: Image.asset('img/logo-removebg-preview.png', width: 150),
                                            )
                                          ],
                                        )
                                      ],
                                    ))
                              ]),
                          Container(
                              padding: EdgeInsets.only(top:15, left: 8, right: 8),
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child:
                              Center(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showCustomDialog(
                                          context,
                                          onValue: (_) {
                                          },
                                        );
                                      },
                                      child: Text(
                                        'AGENDAR PASEO',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                            fontFamily: "titulo",
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10, bottom: 2),
                                      child: Text('¡Rápido, agenda tu paseo antes de que alguien más ocupe a tu paseador estrella!',
                                        style: TextStyle(fontFamily: 'titulo', fontSize: 12, color: Colors.black.withOpacity(_opacidad)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          )
                          //validacion()
                        ])
                  ],
                )
        )
    );
  }
  _page4(String VMV,double _opacidad){
    return Center(
        child: Container(
          width: 200,
          height: 400,
          margin: EdgeInsets.only(left:20, right: 20),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_opacidad),
              borderRadius: BorderRadius.circular(25)
          ),
          child:
              Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.only(top:20,right: 10, left: 10),
                          child: Text('Nuestra misión es ser tu primera y única opción cuando necesites que alguien pasee a tu mascota.',
                            style: TextStyle( fontFamily: 'titulo', fontSize: 14, color: Colors.black.withOpacity(_opacidad), ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:35, left: 100),
                          child: Image.asset('img/logo-removebg-preview.png', width: 150),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        ClipPath(
                            clipper: CustomPath(),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                gradient: LinearGradient(
                                  colors: [Color(0xEF4D4D).withOpacity(0.70),Color(0xFAFF00).withOpacity(0.25),Color(0xFEFEFE), ], // Colores del degradado
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 100,
                              height: 120,
                            ),
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.only(top:5,right: 10, left: 10),
                          child: Text('Nuestra visión es ser el software de comunidad paseadora de perros más prestigioso a nivel nacional; reconocida por brindar fiabilidad y servicios de excelente calidad.',
                            style: TextStyle( fontFamily: 'titulo', fontSize: 12, color: Colors.black.withOpacity(_opacidad), ),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.only(top:15,right: 10, left: 10),
                          child: Text(
                              VMV, style: TextStyle(
                                fontFamily: 'texto', fontSize: 12, color: Colors.black.withOpacity(_opacidad),
                              ))
                        ),
                      ],
                    ),
                  )
                ],
              )
        )
    );
  }
}

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.lineTo(size.width - 50, 0);
    path.lineTo(size.width - 90, size.height / 2);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
