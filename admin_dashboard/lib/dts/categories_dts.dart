// ignore_for_file: use_build_context_synchronously

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/modals/modals.dart';
import 'package:flutter/cupertino.dart'
    show CupertinoAlertDialog, CupertinoDialogAction;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categories;
  final BuildContext context;

  CategoriesDTS({
    required this.context,
    required this.categories,
  });

  @override
  DataRow getRow(int index) {
    Categoria category = categories[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => CategoryModal(
                            category: category,
                          ));
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(
                onPressed: () {
                  final dialog = (!(Theme.of(context).platform ==
                          TargetPlatform.iOS))
                      ? AlertDialog(
                          title: const Text("Are you sure?"),
                          content: Text(
                              "definitely delete the ${category.nombre} category?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("No")),
                            TextButton(
                                onPressed: () async {
                                  await Provider.of<CategoriesProvider>(context,
                                          listen: false)
                                      .deleteCategory(category.id);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Yes, Delete")),
                          ],
                        )
                      : CupertinoAlertDialog(
                          title: const Text("Are you sure?"),
                          content: Text(
                              "Definitely delete the ${category.nombre} category?"),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"),
                            ),
                            CupertinoDialogAction(
                              onPressed: () async {
                                await Provider.of<CategoriesProvider>(context,
                                        listen: false)
                                    .deleteCategory(category.id);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes, Delete"),
                            ),
                          ],
                        );

                  showDialog(context: context, builder: (_) => dialog);
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8),
                )),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
