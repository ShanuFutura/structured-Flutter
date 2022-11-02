import 'dart:convert';

import 'package:http/http.dart';
import 'package:model_sample/Constants/constants.dart';

class Services{


static Future<Map> postData(Map params,String endPoint)async{
  Response res=await post(Uri.parse(Constants.baseUrl+endPoint),body: params);
  return jsonDecode(res.body);
}

static Future<Map> getData(String endPoint)async{
  Response res=await get(Uri.parse(Constants.baseUrl+endPoint));
  return jsonDecode(res.body);
}
}