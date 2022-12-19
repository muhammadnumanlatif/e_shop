import 'package:e_shop/screens/expense_type/expense_type.dart';
import 'package:e_shop/screens/group_permission/group_permission_screen.dart';
import 'package:e_shop/screens/user_to_group/user_to_group_screen.dart';
import 'package:e_shop/screens/product_company/product_company_screen.dart';
import 'package:e_shop/screens/product_group/product_group_screen.dart';
import 'package:e_shop/screens/product/product_screen.dart';
import 'package:e_shop/screens/product_unit/product_unit_screen.dart';
import 'package:e_shop/screens/sale_area/sale_area_screen.dart';
import 'package:e_shop/screens/group/group.dart';
import 'package:e_shop/screens/user_permission/user_permission.dart';
import 'package:flutter/material.dart';

class PermissionDashboardScreen extends StatefulWidget {
  const PermissionDashboardScreen({Key? key}) : super(key: key);

  @override
  State<PermissionDashboardScreen> createState() => _PermissionDashboardScreenState();
}

class _PermissionDashboardScreenState extends State<PermissionDashboardScreen> {
  int _index = 0;
  List<Widget> screens = [
    const SaveGroupScreen(),
    const GroupPermissionScreen(),
    const UserPermissionScreen(),
    const GroupToUserScreen(),
    const SaleAreaScreen(),
    const ProductCompanyScreen(),
    const ProductGroupScreen(),
    const ProductUnitScreen(),
    const ExpenseTypeScreen(),
    const ProductScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [

          LayoutBuilder(builder: (context,constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child:   NavigationRail(
                    backgroundColor: Theme.of(context).primaryColor,
                    indicatorColor: Colors.white,
                    selectedIconTheme:IconThemeData(
                      color: Theme.of(context).primaryColor
                    ) ,
                    destinations:
                    const [
                      NavigationRailDestination(icon: Icon(Icons.group),label: Text("Add Group")),
                      NavigationRailDestination(icon: Icon(Icons.group_add),label: Text("Group Perm.")),
                      NavigationRailDestination(icon: Icon(Icons.supervised_user_circle),label: Text("User Perm.")),
                      NavigationRailDestination(icon: Icon(Icons.supervised_user_circle_outlined),label: Text("Group to User")),
                      NavigationRailDestination(icon: Icon(Icons.area_chart),label: Text("Sale Area")),
                      NavigationRailDestination(icon: Icon(Icons.work),label: Text("Company")),
                      NavigationRailDestination(icon: Icon(Icons.category),label: Text("Product Group")),
                      NavigationRailDestination(icon: Icon(Icons.category_outlined),label: Text("Product Unit")),
                      NavigationRailDestination(icon: Icon(Icons.monetization_on_outlined),label: Text("Expense Type")),
                      NavigationRailDestination(icon: Icon(Icons.production_quantity_limits),label: Text("Product")),
                    ],
                    selectedIndex: _index,
                    onDestinationSelected: (index){
                      setState(() {
                        _index=index;
                      });
                    },
                  ),
                ),
              ),
            );
          }),
            Expanded(child: screens[_index]),
          ],
        ),
      ),
    );
  }
}
