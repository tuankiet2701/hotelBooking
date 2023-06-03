import 'dart:convert';
import 'package:hotel_booking/core/api/api.dart';
import 'package:hotel_booking/core/models/model.hotel.dart';
import 'package:http/http.dart' as http;

class HotelService {
  Future<List<Hotel>> getAllHotel() async {
    var api = Api.BaseApi + '/hotels';
    var response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Hotel> hotelList =
          jsonList.map((json) => Hotel.fromJson(json)).toList();
      return hotelList;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<Hotel>> getSearchHotel({required String hotelName}) async {
    var api = Api.BaseApi + '/hotels?name=${hotelName}';
    try {
      var response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<Hotel> hotelSearch =
            jsonList.map((json) => Hotel.fromJson(json)).toList();
        return hotelSearch;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<Hotel> getSpecificHotel({required String hotelId}) async {
    var api = Api.BaseApi + '/hotels/id=${hotelId}';
    try {
      var response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Hotel hotelSpec = Hotel.fromJson(json);
        return hotelSpec;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      throw e;
    }
  }
}
