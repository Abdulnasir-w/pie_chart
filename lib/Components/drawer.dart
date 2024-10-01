import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        children: [
          title("AfaqTechnologies", Icons.ac_unit_outlined),
          Divider(
            color: Colors.grey[150],
            thickness: 0.5,
          ),
          const Text(
            "Product Name",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          tile(
              icon: Icons.dashboard,
              title: "Dashboard",
              press: () {},
              isSelected: true),
          tile(icon: Icons.person, title: "Customer Profile", press: () {}),
          tile(
              icon: Icons.person_off_outlined,
              title: "Auditors Profile",
              press: () {}),
          tile(
              icon: Icons.room_service, title: "Service Offered", press: () {}),
          tile(
              icon: Icons.login, title: "Require Authentication", press: () {}),
          tile(icon: Icons.verified, title: "Verifications", press: () {}),
          tile(icon: Icons.work_outline, title: "Working Log", press: () {}),
          tile(icon: Icons.calendar_month, title: "Calendar", press: () {}),
        ],
      ),
    );
  }

  title(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }

  ///
  tile({
    required IconData icon,
    required String title,
    required VoidCallback press,
    bool isSelected = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      selectedTileColor: Colors.blueAccent,
      onTap: press,
      selected: isSelected,
    );
  }
}
