import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: [
                      _buildShareIconButton(Icons.facebook, 'Facebook', () {
                        Share.share('Share on Facebook');
                      }),
                      _buildShareIconButton(Icons.abc_outlined, 'Instagram', () {
                        Share.share('Share on Instagram');
                      }),
                      _buildShareIconButton(Icons.abc, 'WhatsApp', () {
                        Share.share('Share on WhatsApp');
                      }),
                      _buildShareIconButton(Icons.messenger, 'Messenger', () {
                        Share.share('Share on Messenger');
                      }),
                      // Add more icons for other social media platforms
                    ],
                  ),
                );
              },
            );
          },
          child: const Text('Share'),
        ),
      ),
    );
  }

  Widget _buildShareIconButton(IconData iconData, String label, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(iconData),
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
  }
}
