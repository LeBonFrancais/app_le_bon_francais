import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.home), onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },),
                  IconButton(icon: const Icon(Icons.search), onPressed: () {
                    Navigator.pushNamed(context, 'ResearchScreen');
                  },),
                  IconButton(icon: const Icon(Icons.map), onPressed: () {
                    Navigator.pushNamed(context, 'MapScreen');
                  },),
                  IconButton(icon: const Icon(Icons.account_circle_outlined),
                    color: Colors.white,
                    onPressed: () {},),
                ],
              ),
              shape: const CircularNotchedRectangle(),
              color: Colors.redDark
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'Mes\ninformations',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  TextInputField(
                    icon: Icons.account_circle_outlined,
                    hint: 'Nom',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    icon: Icons.account_circle_outlined,
                    hint: 'Prénom',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    icon: Icons.mail,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    icon: Icons.phone,
                    hint: 'Téléphone',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}