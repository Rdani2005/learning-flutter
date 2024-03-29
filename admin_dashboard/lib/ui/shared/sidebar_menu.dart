import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/services.dart';

import 'package:admin_dashboard/ui/shared/widgets/widgets.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final SideMenuProvider sideMenuProvider =
        Provider.of<SideMenuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: "main"),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            isActive: false,
            onPressed: () {
              SideMenuProvider.closeMenu();
            },
          ),
          MenuItem(
            text: 'Analytics',
            icon: Icons.show_chart_outlined,
            isActive: false,
            onPressed: () {
              SideMenuProvider.closeMenu();
            },
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive:
                sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
            onPressed: () => navigateTo(Flurorouter.categoriesRoute),
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onPressed: () {
              SideMenuProvider.closeMenu();
            },
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            isActive: false,
            onPressed: () {
              SideMenuProvider.closeMenu();
            },
          ),
          MenuItem(
            text: 'Users',
            icon: Icons.people_alt_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
            onPressed: () => navigateTo(Flurorouter.usersRoute),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(text: "UI Elements"),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            isActive: false,
            onPressed: () {
              SideMenuProvider.closeMenu();
            },
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            isActive: false,
            onPressed: () => navigateTo("/404"),
          ),
          MenuItem(
            text: 'Blank',
            icon: Icons.post_add_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(text: "Account"),
          MenuItem(
            text: 'Log Out',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () {
              final authProvider =
                  Provider.of<AuthProvider>(context, listen: false);
              authProvider.logout();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff092044),
            Color(0xff092042),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ]);
  }
}
