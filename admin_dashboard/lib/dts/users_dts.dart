import 'package:admin_dashboard/models/models.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:flutter/material.dart';

class UserDTS extends DataTableSource {
  final List<Usuario> users;
  final BuildContext context;

  UserDTS({
    required this.users,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    final user = users[index];

    final image = (user.img == null)
        ? const Image(
            image: AssetImage('assets/no-image.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif',
            image: user.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(ClipOval(
          child: image,
        )),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              NavigationService.replaceTo("/dashboard/users/${user.uid}");
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
