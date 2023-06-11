import 'package:admin_dashboard/dts/categories_dts.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/modals/modals.dart';
import 'package:flutter/material.dart';

// import 'package:admin_dashboard/ui/cards/cards.dart';
import 'package:provider/provider.dart';

import '../labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categorias;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Categories View",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoría')),
              DataColumn(label: Text('Creado Por')),
              DataColumn(label: Text('Acciones')),
            ],
            header: const Text(
              "Categorias Disponibles.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onRowsPerPageChanged: (value) {
              _rowsPerPage = value ?? 10;
              setState(() {});
            },
            actions: [
              CustomIconBtn(
                icon: Icons.add_outlined,
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => const CategoryModal());
                },
                text: "Add",
              ),
            ],
            rowsPerPage: _rowsPerPage,
            source: CategoriesDTS(context: context, categories: categories),
          ),
        ],
      ),
    );
  }
}
