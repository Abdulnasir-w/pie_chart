import 'package:example/Api/Model/auction_model.dart';
import 'package:example/Api/Screen/detail_auction.dart';
import 'package:example/Api/Services/auction_api.dart';
import 'package:flutter/material.dart';

class AuctionScreen extends StatefulWidget {
  const AuctionScreen({super.key});

  @override
  State<AuctionScreen> createState() => _AuctionScreenState();
}

class _AuctionScreenState extends State<AuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Auction List",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Auction>>(
          future: fetchAuctionData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              final auctions = snapshot.data!;
              return ListView.builder(
                itemCount: auctions.length,
                itemBuilder: (context, index) {
                  final auction = auctions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Card(
                      color: Colors.amber,
                      child: ListTile(
                        leading: CircleAvatar(
                            child: auction.image != null
                                ? Image.network(
                                    auction.image,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image_outlined)),
                        title: Text(
                          auction.title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        trailing: Text(
                          "Price: ${auction.price}",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Starting Time: ${auction.startTime}",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailAuction(
                                auction: auction,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          }),
    );
  }
}
