import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gift_provider.dart';
import '../models/gift_model.dart';

class GiftListScreen extends StatefulWidget {
  const GiftListScreen({Key? key}) : super(key: key);

  @override
  State<GiftListScreen> createState() => _GiftListScreenState();
}

class _GiftListScreenState extends State<GiftListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // يتم تحميل الهدايا من Provider
    });
  }

  @override
  Widget build(BuildContext context) {
    final giftProvider = Provider.of<GiftProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('الهدايا الخاصة بي'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: giftProvider.gifts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'لم تنشئ هدايا بعد',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: giftProvider.gifts.length,
              itemBuilder: (context, index) {
                final gift = giftProvider.gifts[index];
                return _buildGiftCard(context, gift);
              },
            ),
    );
  }

  Widget _buildGiftCard(BuildContext context, GiftModel gift) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الاسم والحالة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gift.recipientName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'معرف: ${gift.giftId.substring(0, 8)}...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(gift.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getStatusText(gift.status),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // معلومات الصور
            Row(
              children: [
                Icon(
                  Icons.image,
                  size: 16,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  '${gift.photos.length} صور',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                if (gift.videoUrl != null) ...[
                  Icon(
                    Icons.video_library,
                    size: 16,
                    color: Colors.green[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'فيديو جاهز',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),

            // زر العمل
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // فتح شاشة التحرير
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: Text(
                  gift.status == 'completed' ? 'عرض الفيديو' : 'متابعة التحرير',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'waiting':
        return Colors.orange;
      case 'opened':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'waiting':
        return 'في الانتظار';
      case 'opened':
        return 'تم الفتح';
      case 'completed':
        return 'مكتملة';
      default:
        return status;
    }
  }
}
