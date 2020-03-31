import 'dart:convert';
import 'package:covd_19/Http/allResultJson.dart';
import 'package:covd_19/Http/allCountry.dart';
import 'package:http/http.dart' as http;
import 'package:covd_19/Constant/httpConstant.dart';

class HTTP{
  Future<AllResult> allResult()async{
    String url = HTTPCONSTANT.base+HTTPCONSTANT.all;
    AllResult _allResult;
    var filterData;
      try{
      final response =  await http.get(url);
        filterData = await json.decode(response.body); 
      if(response.statusCode == 200){
        if(filterData != null){
           _allResult =  AllResult.fromJson(filterData);              
        }
      }
    } on Exception catch (ex){
      print (ex);
    }
    return _allResult;
  }

  Future<List<AllCountry>> allCountry()async{
    String url = HTTPCONSTANT.base+HTTPCONSTANT.country;
    List<AllCountry> _allCountry = new List<AllCountry>();
    AllCountry object = new AllCountry();
    List filterData;
      try{
       final response =  await http.get(url);
        filterData = await json.decode(response.body); 
      if(response.statusCode == 200){
        if(filterData != null){
          filterData.forEach((value)=>{
            object = AllCountry.fromJson(value),
            _allCountry.add(object)  
          });
                       
        }
      }
    } on Exception catch (ex){
      print (ex);
    }
    return _allCountry;
  }
}