import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FocuesdMenuProject());
  }
}

class FocuesdMenuProject extends StatefulWidget {
  @override
  _FocuesdMenuProjectState createState() => _FocuesdMenuProjectState();
}

class _FocuesdMenuProjectState extends State<FocuesdMenuProject> {
  List<String> imageList = [
    'https://i.pinimg.com/564x/a6/bd/c7/a6bdc76bb98884e930bfc284f9964927.jpg',
    'https://i.pinimg.com/564x/13/de/13/13de1340535d86fc1934c71d22e028de.jpg',
    'https://i.pinimg.com/564x/3e/81/e5/3e81e5098ed329251a0eff1c0b86a71e.jpg',
    'https://i.pinimg.com/564x/51/4a/2e/514a2ea45a80dcd716f3a9db3cf6ff41.jpg',
    'https://i.pinimg.com/564x/51/f2/31/51f2311878099acf65e9f44f8c19ed56.jpg',
    'https://i.pinimg.com/564x/a6/bd/c7/a6bdc76bb98884e930bfc284f9964927.jpg',
    'https://i.pinimg.com/564x/13/de/13/13de1340535d86fc1934c71d22e028de.jpg',
    'https://i.pinimg.com/564x/3e/81/e5/3e81e5098ed329251a0eff1c0b86a71e.jpg',
    'https://i.pinimg.com/564x/51/4a/2e/514a2ea45a80dcd716f3a9db3cf6ff41.jpg',
    'https://i.pinimg.com/564x/51/f2/31/51f2311878099acf65e9f44f8c19ed56.jpg',
    'https://i.pinimg.com/564x/a6/bd/c7/a6bdc76bb98884e930bfc284f9964927.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focused Menu"),
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        margin: EdgeInsets.all(12),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return FocusedMenuHolder(
              menuItems: [
                FocusedMenuItem(
                    title: Text('Open'),
                    onPressed: () {},
                    trailingIcon: Icon(Icons.open_in_new)),
                FocusedMenuItem(
                    title: Text('Share'),
                    onPressed: () {},
                    trailingIcon: Icon(Icons.share)),
                FocusedMenuItem(
                    title: Text('Favorite'),
                    onPressed: () {},
                    trailingIcon: Icon(Icons.favorite)),
                FocusedMenuItem(
                    title: Text('Delete'),
                    onPressed: () {},
                    trailingIcon: Icon(Icons.delete)),
              ],
              onPressed: () {
                print('Item Clicked !');
              },
              blurSize: 5,
              menuWidth: MediaQuery.of(context).size.width * 0.5,
              menuItemExtent: 45,
              menuBoxDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8)
              ),
              duration: Duration(milliseconds: 100),
              animateMenuItems: true,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
          },
        ),
      ),
    );
  }
}
