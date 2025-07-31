import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Главная страница',
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        widthFactor: 0.5,
        heightFactor: 0.5,
        child: Image.asset("profile.jpg")
      )
    );
  }
}

class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 219,
            child: Container(
              height: 40,
              color: Colors.red,
              child: Row(
                children: [
                  ProfileIcon(key: ValueKey("ProfileIcon"))
                ],
              )
            )
          ),
          Expanded(
            flex: 141,
            child: Container(
              height: 40,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 25,
                    height: 20,
                    color: Colors.green
                  )
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MyCustomAppBar({
    required Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double indicatorsPanelScreenWidth = 372;
    return Column(
      children: [
        Container(
          color: Color(0xFF181818),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: ((screenSize.width - 165) / 2).round(),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(27, 14, 0, 12),
                      child: SvgPicture.asset('../assets/time.svg')
                    )
                  ]
                )
              ),
              Expanded(
                flex: 164,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset('../assets/notch.svg')
                      ],
                    )
                  ]
                ),
              ),
              Expanded(
                flex: ((screenSize.width - 165) / 2).round(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 19, bottom: 15, right: 26.6),
                      width: screenSize.width < indicatorsPanelScreenWidth ? 71.4 : 77.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            '../assets/mobileSignal.svg',
                          ),
                          SvgPicture.asset(
                            '../assets/wifi.svg',
                          ),
                          SvgPicture.asset(
                            '../assets/battery.svg',
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            ]
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(47); 
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: MyCustomAppBar(key: ValueKey("customAppBar")),
      body: Column(
        children: [
          MenuBar(key: ValueKey("MenuBar"))
        ]
      )
    );
  }
}