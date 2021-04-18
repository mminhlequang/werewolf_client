import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/widgets/widget_circle_progress.dart';

class WidgetRoleClassic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RoleRepository().getRoleClassic(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(
              child: WidgetCircleProgress(),
            );
          NetworkResponse<List<RoleModel>> response = snapshot.data;
          if (!response.isSuccess) return SizedBox();
          List<RoleModel> roles = response.data;
          return ListView.builder(
            itemCount: roles.length,
            itemBuilder: (context, index) {
              return StickyHeader(
                header: Container(
                  height: 50.0,
                  color: COLOR_PRIMARY_LIGHT,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    roles[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Icon(Icons.person_pin_outlined),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                        child: Column(
                          children: [
                            Text(
                              roles[index].description,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
