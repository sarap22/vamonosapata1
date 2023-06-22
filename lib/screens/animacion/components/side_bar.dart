import 'package:flutter/material.dart';
import '../../../model/menu.dart';
import '../../../utils/rive_utils.dart';
import '../../../widget/button.dart';
import '../../principal.dart';
import '../../registros.dart';
import '../entry_point.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}
class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(238, 149, 149, 9),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white, fontFamily: "titulo"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Holi".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: selectedSideMenu,
                        press: () {
                          RiveUtils.chnageSMIBoolState(menu.rive.status!);
                          Future.delayed(Duration(milliseconds:370), (){
                            switch (menu.title) {
                              case "Home":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => info()),
                                );
                              break;
                              case "Mi perfil":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => registerDuenio()),
                                );
                              break;
                              case "Paseadores":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => navBarVertical()),
                                );
                              break;
                              case "Agendar cita":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => bLogin()),
                                );
                              break;
                            }
                          }
                          );
                          setState(() {
                            selectedSideMenu = menu;
                          });
                        },
                        riveOnInit: (artboard) {
                          menu.rive.status = RiveUtils.getRiveInput(artboard,
                              stateMachineName: menu.rive.stateMachineName);
                        },
                      ))
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
              ),
              ...sidebarMenus2
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: selectedSideMenu,
                        press: () {
                          RiveUtils.chnageSMIBoolState(menu.rive.status!);
                          Future.delayed(Duration(milliseconds:370), (){
                            switch (menu.title) {
                              case "Mis mascotas":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => registroPaseador()),
                                );
                                break;
                              case "Notificaciones":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => registerDuenio()),
                                );
                                break;
                            }
                          }
                          );
                          setState(() {
                            selectedSideMenu = menu;
                          });
                        },
                        riveOnInit: (artboard) {
                          menu.rive.status = RiveUtils.getRiveInput(artboard,
                              stateMachineName: menu.rive.stateMachineName);
                        },
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
