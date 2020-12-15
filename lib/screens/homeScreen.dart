import 'package:bexture/services/userServices.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getdata(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var myData = snapshot.data[index];
                return ListTile(
                  trailing: Text(myData.id.toString()),
                  subtitle: Text(myData.email.toString()),
                  title: Text("${myData.firstName} " " ${myData.lastName}"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(myData.avatar),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
