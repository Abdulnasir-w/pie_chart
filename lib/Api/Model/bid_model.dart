class Bid {
  final String id;
  final String auctionId;
  final String userId;
  final String price;
  final String date;
  final String name;
  final String email;
  final String phone;
  final String win;
  final String image;

  Bid({
    required this.id,
    required this.auctionId,
    required this.userId,
    required this.price,
    required this.date,
    required this.name,
    required this.email,
    required this.phone,
    required this.win,
    required this.image,
  });

  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(
      id: json['id'],
      auctionId: json['auction_id'],
      userId: json['user_id'],
      price: json['price'],
      date: json['date'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      win: json['win'],
      image: json['image'],
    );
  }
}
