// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/models/models.dart';
import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/ui/cards/cards.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import '../labels/custom_labels.dart';

class SingleUserView extends StatefulWidget {
  const SingleUserView({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  State<SingleUserView> createState() => _SingleUserViewState();
}

class _SingleUserViewState extends State<SingleUserView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    final UsersProvider usersProvider =
        Provider.of<UsersProvider>(context, listen: false);
    final UpdateUserProvider updateUserProvider =
        Provider.of<UpdateUserProvider>(context, listen: false);
    usersProvider.getUserByUID(widget.uid).then((userBack) {
      setState(
        () {
          if (userBack != null) {
            user = userBack;
            updateUserProvider.user = userBack;
            updateUserProvider.formKey = GlobalKey<FormState>();
          } else {
            NavigationService.replaceTo(Flurorouter.usersRoute);
          }
        },
      );
    });
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UpdateUserProvider>(context).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Single User",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          if (user == null)
            WhiteCard(
              child: Container(
                height: 400,
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive(),
              ),
            ),
          if (user != null) _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(250),
      },
      children: [
        TableRow(children: [
          _AvatarContainer(),
          // Update Form
          _UserViewForm()
        ])
      ],
    );
  }
}

class _UserViewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UpdateUserProvider updateUserProvider =
        Provider.of<UpdateUserProvider>(context);
    final user = updateUserProvider.user;
    return WhiteCard(
      title: "General User Information",
      child: Form(
        key: updateUserProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Name is required.';
                return null;
              },
              onChanged: (value) => updateUserProvider.username = value,
              initialValue: user?.nombre ?? '',
              decoration: CustomInputs.formInputDecoration(
                hint: 'Jhon',
                label: 'Name',
                icon: Icons.person_2_outlined,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: user?.correo ?? '',
              onChanged: (value) => updateUserProvider.userEmail = value,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Enter your Email.";
                }

                if (!EmailValidator.validate(value)) {
                  return 'Email not valid.';
                }

                return null;
              },
              decoration: CustomInputs.formInputDecoration(
                hint: 'Jhon@email.com',
                label: 'Email',
                icon: Icons.mark_email_read_outlined,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: ElevatedButton(
                  onPressed: () async {
                    final saved = await updateUserProvider.updateUser();
                    if (saved) {
                      Provider.of<UsersProvider>(context, listen: false)
                          .refreshUsers(user!);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.save_outlined),
                      Text("Save"),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UpdateUserProvider updateUserProvider =
        Provider.of<UpdateUserProvider>(context);

    final image = (updateUserProvider.user?.img == null)
        ? const Image(
            image: AssetImage('assets/no-image.jpg'),
          )
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif',
            image: updateUserProvider.user!.img!,
          );
    return WhiteCard(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: CustomLabels.h2,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  ClipOval(
                    child: image,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: FloatingActionButton(
                        onPressed: () async {
                          FilePickerResult? res =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'jpeg', 'png'],
                            allowMultiple: false,
                          );

                          if (res != null) {
                            PlatformFile file = res.files.first;
                            await updateUserProvider.uploadImage(
                              "/uploads/usuarios/${updateUserProvider.user!.uid}",
                              file.bytes!,
                            );
                            Provider.of<UsersProvider>(context, listen: false)
                                .refreshUsers(updateUserProvider.user!);
                          }
                        },
                        backgroundColor: Colors.indigo,
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              updateUserProvider.user?.nombre ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
