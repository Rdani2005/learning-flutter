import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/models/models.dart';
import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({
    super.key,
    this.category,
  });

  final Categoria? category;

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.category?.nombre;
    name = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      padding: const EdgeInsets.all(20), // Expanded
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category?.nombre ?? "New Category",
                style: CustomLabels.h1.copyWith(
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white)),
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.category?.nombre ?? '',
            onChanged: (value) => name = value,
            decoration: CustomInputs.authInputDecoration(
              hint: 'Category Name',
              label: 'Category',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlineBtn(
              onPressed: () async {
                if (widget.category?.id == null) {
                  await Provider.of<CategoriesProvider>(context, listen: false)
                      .newCategory(name);
                } else {
                  await Provider.of<CategoriesProvider>(context, listen: false)
                      .updateCategory(name, widget.category!.id);
                }

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              text: "Save",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color(0xff0f2041),
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
      );
}
