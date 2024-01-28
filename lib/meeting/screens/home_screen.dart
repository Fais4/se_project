import 'package:flutter/material.dart';
import 'package:newflutter3/meeting/utils/colors.dart';
import 'package:newflutter3/meeting/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? Key}) : super(key: Key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [HomeMeetingButton(onPressed: (){},
        text: 'New Meeting',
        icon: Icons.videocam),
        HomeMeetingButton(onPressed: (){},
        text: 'Join Meeting',
        icon: Icons.add_box_rounded),
        HomeMeetingButton(onPressed: (){},
        text: 'Schedule Meeting',
        icon: Icons.calendar_today),
        HomeMeetingButton(onPressed: (){},
        text: 'Share Screen',
        icon: Icons.arrow_upward_rounded),

        ],
      ),
      const Expanded(child: Center(child: Text('Create/join Meetings',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))))
      ]
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.logout_rounded,
              ),
              label: 'Back',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet & char',
            ),
          ]),
    );
  }
}
