import 'package:example/Api/Model/auction_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Auction>> fetchAuctionData() async {
  final response = await http.get(Uri.parse(
      "http://awamisolution.com/auction/aucation_user_list.php?user_id=1"));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    List<Auction> auctions = (jsonResponse['auction'] as List)
        .map((auctionJson) => Auction.fromJson(auctionJson))
        .toList();
    return auctions;
  } else {
    throw Exception("Failde to Load To Auction Data");
  }
}
