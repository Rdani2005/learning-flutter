import 'package:admin_dashboard/dts/users_dts.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Users",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: const Text('Name'),
                  onSort: (i, __) {
                    usersProvider.sortColumnIndex = i;
                    usersProvider.sort((user) => user.nombre);
                  }),
              DataColumn(
                  label: const Text('Email'),
                  onSort: (i, __) {
                    usersProvider.sortColumnIndex = i;
                    usersProvider.sort((user) => user.correo);
                  }),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Actions')),
            ],
            header: const Text(
              "Usuarios Disponibles.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            source: UserDTS(context: context, users: usersProvider.users),
            onPageChanged: (page) {},
          ),
        ],
      ),
    );
  }
}
