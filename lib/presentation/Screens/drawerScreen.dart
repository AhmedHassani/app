import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giesse_app/gen/assets.gen.dart';
import 'package:giesse_app/infrastructure/models/drawerItem.dart';
import 'package:giesse_app/presentation/Screens/customersScreen.dart';
import 'package:giesse_app/presentation/Widgets/text.dart';

// Hambuger menu (Drawer)
class NavigationDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawer> {
  int _selectedIndex = 0;

  final drawerItemsCategory1 = [
    DrawerItem(
        name: "Customers",
        iconPath: Assets.icons.menu.customers.path,
        navigate: '/CustomersScreen'),
    DrawerItem(
        name: "Map",
        iconPath: Assets.icons.menu.map.path,
        navigate: '/CustomersScreen'),
    DrawerItem(
        name: "Order History",
        iconPath: Assets.icons.menu.orderHistory.path,
        navigate: '/OrderHistoryScreen'),
    DrawerItem(
        name: "Cart",
        iconPath: Assets.icons.menu.products.path,
        navigate: '/CartScreen'),
    DrawerItem(
        name: "Taking",
        iconPath: Assets.icons.menu.takings.path,
        navigate: '/TakingScreen'),
    DrawerItem(
        name: "Agents",
        iconPath: Assets.icons.menu.agents.path,
        navigate: '/CustomersScreen'),
    DrawerItem(
        name: "Suppliers",
        iconPath: Assets.icons.menu.suppliers.path,
        navigate: '/SuppliersScreen'),
    DrawerItem(
        name: "Agent Statistics",
        iconPath: Assets.icons.menu.agentsStatistics.path,
        navigate: '/CustomersScreen'),
  ];
  final drawerItemsCategory2 = [
    DrawerItem(
        name: "Catalogue",
        iconPath: Assets.icons.menu.catalog.path,
        navigate: '/CatalogScreen'),
    DrawerItem(
        name: "Remote Files",
        iconPath: Assets.icons.menu.remoteFiles.path,
        navigate: '/CatalogScreen'),
    DrawerItem(
        name: "CRM",
        iconPath: Assets.icons.menu.crm.path,
        navigate: '/CustomersScreen'),
  ];
  final drawerItemsCategory3 = [
    DrawerItem(
        name: "About",
        iconPath: Assets.icons.menu.about.path,
        navigate: '/CustomersScreen'),
  ];
  _getDrawerItemScreen(int pos) {
    return CustomersScreen();
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
      _getDrawerItemScreen(_selectedIndex);
    });
    Navigator.of(context).pop(); // close the drawer
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _getDrawerItemScreen(_selectedIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions1 = [];
    List<Widget> drawerOptions2 = [];
    List<Widget> drawerOptions3 = [];
    for (var i = 0; i < drawerItemsCategory1.length; i++) {
      var d = drawerItemsCategory1[i];
      drawerOptions1.add(buildListTile(d, i));
    }
    for (var i = 0; i < drawerItemsCategory2.length; i++) {
      var d = drawerItemsCategory2[i];
      drawerOptions2.add(buildListTile(d, i));
    }
    for (var i = 0; i < drawerItemsCategory3.length; i++) {
      var d = drawerItemsCategory3[i];
      drawerOptions3.add(buildListTile(d, i));
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Image.asset(
                'assets/images/giesseLogo2.png',
                width: 162,
              ),
            ),
          ),
          Divider(),
          Column(children: drawerOptions1),
          Divider(),
          Column(children: drawerOptions2),
          Divider(),
          Column(children: drawerOptions3),
        ],
      ),
    );
  }

  ListTile buildListTile(DrawerItem d, int i) {
    return ListTile(
      leading: SvgPicture.asset(
        d.iconPath,
        color: Colors.grey,
        width: 24,
        height: 24,
      ),
      title: text(
        d.name,
        fontSize: 18.0,
      ),
      selected: i == _selectedIndex,
      contentPadding: EdgeInsets.only(left: 25),
      focusColor: Colors.red,
      horizontalTitleGap: 15.0,
      onTap: () => Navigator.of(context).pushReplacementNamed(d.navigate),
    );
  }
}
