import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rive/rive.dart';
import '../screens/animacion/entry_point.dart';
import '../screens/principal.dart';
import '../screens/registros.dart';

class bLogin extends StatefulWidget {
  const bLogin({super.key});

  @override
  State<bLogin> createState() => _bLoginState();
}

class _bLoginState extends State<bLogin> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
          child:
            AnimatedBtnLogin(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                  Future.delayed(
                    const Duration(milliseconds: 800), () {
                      setState(() {
                        isShowSignInDialog = true;
                      });
                      showCustomDialog(
                        context,
                        onValue: (_) {
                        },
                      );
                      },
                  );
                      }
                      )
    );
  }
}

class AnimatedBtnLogin extends StatelessWidget {
  const AnimatedBtnLogin({
    Key? key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  })  : _btnAnimationController = btnAnimationController,
        super(key: key);

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 170,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.arrow_right),
                  const SizedBox(width: 8),
                  Text(
                    "Ingresar",
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
void selectBtn(BuildContext context, {required ValueChanged onValue}) {
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
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.only(top:100),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(238, 149, 149, 9),
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
                          child:const Text("SELECCIONA TU ROL", style: TextStyle(fontFamily: "titulo", fontSize: 27, color: Colors.white,)),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top:40),
                            child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.only(top: 20),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color.fromRGBO(255, 205, 163, 9),
                                    ),
                                    child: Column(
                                      children:[
                                        GestureDetector(
                                          onTap: () {
                                            registerAdminContent(
                                              context,
                                              onValue: (_) {
                                              },
                                            );
                                          },
                                          child: Image.asset("img/location (1).png", width: 80),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text("Administrador", style: TextStyle(fontSize: 20, fontFamily: "titulo", color: Colors.lightBlue[600]))
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(top: 25),
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color.fromRGBO(255, 205, 163, 9),
                                    ),
                                    child: Column(
                                        children:[
                                          GestureDetector(
                                            onTap: () {
                                                registerPaseadorContent(
                                                  context,
                                                  onValue: (_) {

                                                  },
                                                );
                                            },
                                            child: Image.asset("img/location (1).png", width: 80),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Text("Paseador", style: TextStyle(fontSize: 20, fontFamily: "titulo", color: Colors.lightBlue[600]))
                                          )
                                        ]),
                                  ),
                                ])
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 20),
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromRGBO(255, 205, 163, 9),
                          ),
                          child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    registerDuenioContent(
                                      context,
                                      onValue: (_) {

                                      },
                                    );
                                  },
                                  child: Image.asset("img/location (1).png", width: 80),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text("Dueño", style: TextStyle(fontSize: 20, fontFamily: "titulo", color: Colors.lightBlue[600]))
                                )
                              ]),
                        )
                      ]),
                ],
              ),
            ),
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