import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vamonosapata/screens/registros.dart';
import 'package:vamonosapata/widget/button.dart';
import '../../model/menu.dart';
import '../../utils/rive_utils.dart';
import '../principal.dart';
import 'components/btm_nav_item.dart';
import 'components/menu_btn.dart';
import 'components/side_bar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}
class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  Menu selectedBottonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(255, 205, 184, 9),
      body: Stack(
        children: [
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child:  SideBar(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  child: HomePage(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 220 : 0,
            top: 16,
            child: MenuBtn(
              press: () {
                isMenuOpenInput.value = !isMenuOpenInput.value;

                if (_animationController.value == 0) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(
                  () {
                    isSideBarOpen = !isSideBarOpen;
                  },
                );
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");

                artboard.addController(controller!);

                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = true;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Color(0x74C7B8).withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x74C7B8).withOpacity(0.6),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavItems.length,
                  (index) {
                    Menu navBar = bottomNavItems[index];
                    return BtmNavItem(
                      navBar: navBar,
                      press: () {
                        RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                        updateSelectedBtmNav(navBar);
                        Future.delayed(Duration(milliseconds:400), (){
                          switch (navBar.title) {
                            case "Chat":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => bLogin()),
                              );
                            break;
                            case "Search":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registerDuenio()),
                              );
                            break;
                            case "Timer":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registroPaseador()),
                              );
                              break;
                            case "Notification":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => info()),
                              );
                              break;
                            case "Profile":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => info()),
                              );
                              break;
                          }
                        }
                        );
                      },
                      riveOnInit: (artboard) {
                        navBar.rive.status = RiveUtils.getRiveInput(artboard,
                            stateMachineName: navBar.rive.stateMachineName);
                      },
                      selectedNav: selectedBottonNav,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
              child: Container(
                  color: Color.fromRGBO(116, 199, 184,9).withOpacity(0.8),
                  width: double.infinity,
                  height: 140,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top:30),
                      child: Image.asset("img/letraslogo_preview_rev_1.png", width: 250,),)
                  ),
              ),
      ),
    );
  }
}

class navBarVertical extends StatefulWidget {
  const navBarVertical({super.key});

  @override
  State<navBarVertical> createState() => _navBarVerticalState();
}

class _navBarVerticalState extends State<navBarVertical> {
  bool _isVisible = false;
  bool _isVisible1 = false;
  bool _isVisible2 = false;
  bool light0 = true;
  bool light1 = true;
  final int pageCount = 5;
  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.sunny);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                            Container(
                              width: 300,
                              margin: EdgeInsets.only(
                                top: 50, left: 120,right: 10,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 60
                                    ),
                                    child: RichText(text: const TextSpan(
                                      text: "Fontibón", style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "titulo",
                                        fontSize: 20
                                    ),
                                    ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 50,
                                        top: 7,
                                        bottom: 5
                                      ),
                                    child: Row(
                                      children: [
                                        Image.asset("img/location (1).png", width: 20,),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 5
                                          ),
                                          child: Text("Bogotá, Colombia", style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: "titulo",),),
                                        ),

                                      ],
                                    )
                                  )
                                ],
                              ),
                            )
                      ],
                    ),
                    Expanded(
                        child:
                        Container(
                            margin: EdgeInsets.only(left:150, right: 20),
                          child:
                          ListView(
                            children: <Widget>[
                              card(),
                              card(),
                              card(),
                              card(),
                            ],
                          )
                        )
                    )
                  ],
                )
              )
          ),
          Container(
            width: 200,
            height: double.infinity,
            child: Column(
              children:[
                Row(
                  children:[
                    Container(
                      color: const Color.fromRGBO(116, 199, 184, 9),
                      height: 210,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isVisible = !_isVisible;// Cambia el estado de visibilidad
                            });
                          },
                          child: Transform.rotate(
                              angle: 300,
                              child: Container(
                                padding: EdgeInsets.only(top:90),
                                child: Text(
                                  "Kucing",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: "titulo"
                                  ),
                                ),
                              )
                          )
                      ),
                    ),
                      if (_isVisible)
                        Container(
                          child: Image.asset("img/formaSelect.png")
                        ),
                      ],
                    ),
                Row(
                  children:[
                    Container(
                        color: const Color.fromRGBO(116, 199, 184, 9),
                        height: 210,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isVisible1 = !_isVisible1;// Cambia el estado de visibilidad
                              });
                            },
                            child: Transform.rotate(
                                angle: 300,
                              child: Container(
                                padding: EdgeInsets.only(top:90),
                                child: Text(
                                  "Kucing",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: "titulo"
                                  ),
                                ),
                              )
                            )
                          ),
                    ),
                    if (_isVisible1)
                      Container(
                        child: Image.asset("img/formaSelect.png")
                      ),
                  ],
                ),
                Row(
                  children:[
                    Container(
                      color: const Color.fromRGBO(116, 199, 184, 9),
                      height: 210,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isVisible2 = !_isVisible2;// Cambia el estado de visibilidad
                            });
                          },
                          child: Transform.rotate(
                              angle: 300,
                              child: Container(
                                padding: EdgeInsets.only(top:90),
                                child: Text(
                                  "Kucing",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: "titulo"
                                  ),
                                ),
                              )
                          )
                      ),
                    ),
                    if (_isVisible2)
                      Container(
                          child: Image.asset("img/formaSelect.png")
                      ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 107),
                  color: const Color.fromRGBO(116, 199, 184, 9),
                  height: 208,
                  width: 105,
                  child: Switch(
                    inactiveThumbColor: Color.fromRGBO(116, 199, 184, 9),
                    activeColor: Colors.white,
                    value: light0,
                    onChanged: (bool value) {
                      setState(() {
                        light0 = value;
                      });
                    },
                  ),
                ),
              ]
            )
          ),

          ],
      ),
    );
  }
}

class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom:20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(238, 149, 149, 9),
        ),
        child: Column(
          children: [
            Text("Kelso", style: TextStyle(fontFamily: "titulo", fontSize: 25, color: Colors.black), textAlign: TextAlign.start,),
            RichText(text: const TextSpan(
                text: "Point Place", style: TextStyle(
                color: Colors.white,
                fontFamily: "titulo",
                fontSize: 25
            )
            ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top:10),
              child: Image.asset("img/kelso.png", width: 200,),
            )
          ],
        ),
    );
  }
}
