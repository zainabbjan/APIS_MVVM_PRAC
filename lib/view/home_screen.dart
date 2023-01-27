import 'package:flutter/material.dart';
import 'package:mvvm_prac/utills/routes/routes_name.dart';
import 'package:mvvm_prac/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPrefrences = Provider.of<UserViewModel>(context);
    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading:  false,
      actions: [
        InkWell(
                onTap: (() {
                  userPrefrences.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                }),
                child: Center(child: Text('Logout'))),
                SizedBox(width:  20,)
      ],
    ),
      body: SafeArea(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
