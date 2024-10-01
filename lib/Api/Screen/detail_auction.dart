import 'package:example/Api/Model/auction_model.dart';
import 'package:flutter/material.dart';

class DetailAuction extends StatelessWidget {
  final Auction auction;
  const DetailAuction({super.key, required this.auction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(auction.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              Center(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.network(
                    auction.image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                auction.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8.0),
              Text(
                auction.description,
                textAlign: TextAlign.justify,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8.0),
              makeingRow(title: "Price : ", data: auction.price),
              const SizedBox(height: 8.0),
              makeingRow(title: "Auction Date : ", data: auction.date),
              const SizedBox(height: 8.0),

              makeingRow(title: "Starting Time : ", data: auction.startTime),
              const SizedBox(height: 8.0),

              makeingRow(title: "Ending Time : ", data: auction.endTime),
              const SizedBox(height: 16.0),
              auction.certificate.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Certificate",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 16.0),
                        Image.network(auction.certificate)
                      ],
                    )
                  : Container(),
              const SizedBox(height: 16.0),
              auction.bids.isNotEmpty
                  ? buildBidList()
                  : const Text("No Bids Available"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBidList() {
    return Column(
      children: [
        const Text(
          "Bids",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8.0),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: auction.bids.length,
          itemBuilder: (context, index) {
            final bid = auction.bids[index];
            return ListTile(
              leading: Image.network(
                bid.image,
                height: 50,
                width: 50,
              ),
              title: Text(bid.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price: ${bid.price}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Date: ${bid.date}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing: Text(
                'Win Status: ${bid.win}',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            );
          },
        )
      ],
    );
  }

  makeingRow({required String title, required String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Text(
          data,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
