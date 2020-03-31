import 'package:covd_19/Http/allResultJson.dart';
import 'package:covd_19/Http/allCountry.dart';
import 'package:covd_19/Http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Constant/styles.dart';
import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<AllResult> _allResult;
  Future<List<AllCountry>> _allCountryDart;
  Future<List> data;
  String searchingFilter;
  DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
  TextEditingController _searchingCountriesController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _allResult = HTTP().allResult();
    data = HTTP().allCountry();
    _allCountryDart = HTTP().allCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: FutureBuilder<AllResult>(
             future: _allResult,
             builder: (context,snapshot){
               if(snapshot.hasData){
                 var date = new DateTime.fromMillisecondsSinceEpoch(snapshot.data.updated * 1000);
                //  DateTime date = dateFormat.parse(convert.toUtc().toIso8601String());
                print(date);
                 return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: Styles.linearGradient,
                                  ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: TextFormField(
                                          controller: _searchingCountriesController,
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            labelText: "Search country",
                                             hintStyle: new TextStyle(
                                              color: Colors.white
                                            ),
                                            labelStyle: new TextStyle(
                                              color: Colors.white
                                            ),
                                            icon: Icon(
                                              Icons.search,
                                              color: Colors.white
                                            ), 
                                            border: InputBorder.none         
                                        ),
                                          style: TextStyle(color: Colors.white),
                                          onTap: (){
                                            setState(() {
                                                _searchingCountriesController.addListener((){
                                                setState(() {
                                                searchingFilter = _searchingCountriesController.text;
                                                });
                                              });
                                            });
                                          },
                                        ),
                                      ),
                                  ),
                            ),
                          ),
                        Text("All over the world",style: TextStyle(fontSize:20,color: Colors.black54,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            cardView("Active Cases",snapshot.data.cases.toString()),
                            cardView("Deaths",snapshot.data.deaths.toString()),
                          ],
                        ),
                        cardView("Recovered",snapshot.data.recovered.toString()),     
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Affected Countries",style: TextStyle(fontSize:20,color: Colors.black54,fontWeight: FontWeight.bold),),
                        ),
                         Container(
                          height: MediaQuery.of(context).size.height/2,
                          child: FutureBuilder<List<AllCountry>>(
                            future: _allCountryDart,
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context,index){
                                    return searchingFilter == null || searchingFilter == "" ?
                                     ExpandablePanel(
                                      header:  Padding(
                                                  padding: const EdgeInsets.only(left: 25.0,top: 10.0),
                                                      child: Text(snapshot.data[index].country
                                                        ,style: TextStyle(fontSize:20,color: Colors.black54,fontWeight: FontWeight.bold), 
                                                        overflow: TextOverflow.ellipsis,),
                                                  ),
                                      tapHeaderToExpand: true,
                                      tapBodyToCollapse:true,
                                      hasIcon: true,
                                      iconColor: Colors.grey,
                                      expanded: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 5.0,left: 25.0,bottom: 5.0),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width/2,
                                                          child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            new Text('Cases:',style:TextStyle(color: Colors.grey)),
                                                            new Text('Today Cases:',style:TextStyle(color: Colors.grey)),
                                                            new Text('Deaths:',style:TextStyle(color: Colors.grey)),  
                                                            new Text('Recovered:',style:TextStyle(color: Colors.grey)),  
                                                            new Text('Active:',style:TextStyle(color: Colors.grey)),
                                                            new Text('Case per One Million: ',style:TextStyle(color: Colors.grey)),
                                                            new Text('Deaths per One Million: ',style:TextStyle(color: Colors.grey)),
                                                          ],
                                                          ),
                                                        ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0,bottom: 5.0,right: 15),
                                                    child: Align(
                                                    alignment: Alignment.center,
                                                      child: Container(
                                                        child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          new Text(snapshot.data[index].cases.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].todayCases.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].deaths.toString(),style:TextStyle(color: Colors.grey)), 
                                                          new Text(snapshot.data[index].recovered.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].active.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].casesPerOneMillion.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].deathsPerOneMillion.toString(),style:TextStyle(color: Colors.grey)),
                                                        ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ],
                                                ),
                                            )
                                    :snapshot.data[index].country.toLowerCase().contains(searchingFilter.toLowerCase())?
                                      ExpandablePanel(
                                      header:Padding(
                                                  padding: const EdgeInsets.only(left: 25.0,top: 10.0),
                                                      child: Text(snapshot.data[index].country
                                                        ,style: TextStyle(fontSize:20,color: Colors.black54,fontWeight: FontWeight.bold), 
                                                        overflow: TextOverflow.ellipsis,),
                                                  ),
                                      tapHeaderToExpand: true,
                                      hasIcon: true,
                                      iconColor: Colors.grey,
                                      expanded: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 5.0,left: 25.0,bottom: 5.0),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width/2,
                                                          child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            new Text('Cases:',style:TextStyle(color: Colors.grey)),
                                                            new Text('Today Cases:',style:TextStyle(color: Colors.grey)),
                                                            new Text('Deaths:',style:TextStyle(color: Colors.grey)),  
                                                            new Text('Recovered:',style:TextStyle(color: Colors.grey)),  
                                                            new Text('Active:',style:TextStyle(color: Colors.grey)),
                                                            new Text('Case per One Million: ',style:TextStyle(color: Colors.grey)),
                                                            new Text('Deaths per One Million: ',style:TextStyle(color: Colors.grey)),
                                                          ],
                                                          ),
                                                        ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0,bottom: 5.0,right: 15),
                                                    child: Align(
                                                    alignment: Alignment.center,
                                                      child: Container(
                                                        child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          new Text(snapshot.data[index].cases.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].todayCases.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].deaths.toString(),style:TextStyle(color: Colors.grey)), 
                                                          new Text(snapshot.data[index].recovered.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].active.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].casesPerOneMillion.toString(),style:TextStyle(color: Colors.grey)),
                                                          new Text(snapshot.data[index].deathsPerOneMillion.toString(),style:TextStyle(color: Colors.grey)),
                                                        ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ],
                                                ),
                                            )
                                      : Container(); 
                                   });
                              }else{
                                return Center(
                                  child: SpinKitSquareCircle(
                                          color: Colors.red,
                                          size: 20.0,
                                        ),
                                );
                              }
                            }),
                        ),
                ],
               ),
              ),
                 );
             }else{
                 return Center(
                   child:  SpinKitSquareCircle(
                      color: Colors.red,
                      size: 50.0,
                    )
                  );
                }
               },
             ),
        ),
      ),
    );
  }
  Widget cardView(String title,String content){
    return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: MediaQuery.of(context).size.width/2.5,
              decoration: new BoxDecoration(
                  border: new Border(
                    bottom: new BorderSide(color: Colors.red,width: 2.0, style: BorderStyle.solid),
                  ),
              ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                    Text(title,style: TextStyle(fontSize:15,color: Colors.black54,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(content,style: TextStyle(fontSize:15,color: Colors.black54,fontWeight: FontWeight.bold),),
                    ),
                ]
              ),
            ),
        ),
    );
  }
}