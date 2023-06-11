import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.network(
            "https://media.licdn.com/dms/image/D4E03AQGjnTsy5UnZhQ/profile-displayphoto-shrink_800_800/0/1681917465221?e=1691625600&v=beta&t=gE3xq2ftbzfw4H040Y5DaHZJTRB6zZXpu9-fG8Ln00g"),
      ),
    );
  }
}
