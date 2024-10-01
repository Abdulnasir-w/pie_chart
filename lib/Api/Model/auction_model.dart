import 'package:example/Api/Model/bid_model.dart';

class Auction {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String image;
  final String certificate;
  final String date;
  final String startTime;
  final String endTime;
  final String timing;
  final String price;
  final String status;
  final List<Bid> bids;

  Auction({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.image,
    required this.certificate,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.timing,
    required this.price,
    required this.status,
    required this.bids,
  });

  factory Auction.fromJson(Map<String, dynamic> json) {
    var bidList = json['bid'] as List? ?? [];
    List<Bid> bidObjs = bidList.map((bid) => Bid.fromJson(bid)).toList();
    return Auction(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      image: json['images'],
      certificate: json['certificate'],
      date: json['date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      timing: json['timing'],
      price: json['price'],
      status: json['status'],
      bids: bidObjs,
    );
  }
}
