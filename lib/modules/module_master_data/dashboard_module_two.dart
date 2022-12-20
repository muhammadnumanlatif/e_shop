import 'package:e_shop/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'expense_type/expense_type.dart';
import 'product/product_screen.dart';
import 'product_company/product_company_screen.dart';
import 'product_group/product_group_screen.dart';
import 'product_unit/product_unit_screen.dart';
import 'sale_area/sale_area_screen.dart';

class DashboardMasterData extends StatefulWidget {
  const DashboardMasterData({Key? key}) : super(key: key);

  @override
  State<DashboardMasterData> createState() => _DashboardMasterDataState();
}

class _DashboardMasterDataState extends State<DashboardMasterData> {
  int _index = 0;
  List<Widget> screens = [
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
                      leading: IconButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                      }, icon: Icon(Icons.arrow_back)),
                      backgroundColor: Theme.of(context).primaryColor,
                      indicatorColor: Colors.white,
                      selectedIconTheme:IconThemeData(
                          color: Theme.of(context).primaryColor
                      ) ,
                      destinations:
                      const [
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
