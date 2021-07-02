import 'package:ami_coding_pari_na/screens/home/chobi_dekhao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  TextEditingController _inputVal = TextEditingController();
  TextEditingController _searchVal = TextEditingController();

  var result;

  khoj() {
    List<String> values = _inputVal.text.split(",");
    result = values.contains(_searchVal.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            icon: Icon(Icons.view_list, color: Colors.white, size: 30,),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 10,
        child: Container(
          width: 337,
          height: 896,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/shape.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                margin: EdgeInsets.all(1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'INTERVIEW TASK',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'github.com/mehedimithu',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.search),
                      title: Text(
                        'Khoj the search',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.image_outlined),
                      title: Text(
                        'Dekhao Chobi',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChobiDekhao()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _inputVal,
                  decoration: new InputDecoration(
                    labelText: "Input",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _searchVal,
                  decoration: new InputDecoration(labelText: "Search"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: "${result??''}",
                  ),
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  khoj();

                },
                color: Colors.green,
                child: new Text(
                  "Khoj",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          )),
    );
  }
}
