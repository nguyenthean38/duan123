import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_end/data/models/destination_model.dart';

class EntertainmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> addEntertainment(DestinationModel entertainment) async {
    try {
      await _firestore.collection('Entertainment').doc(entertainment.id).set(entertainment.toJson());
      print('Successfully added hotel with id: ${entertainment.id}');
    } catch (e) {
      print('Error adding hotel with id: ${entertainment.id}: $e');
    }
  }

  // Add sample entertainment data to Firestore if it doesn't already exist
  Future<void> addSampleEntertainment() async {
    final List<DestinationModel> sampleEntertainment = [
      DestinationModel(
        id: '15',
        name: 'Công Viên Nước Đầm Sen',
        imageUrl: 'https://lh7-us.googleusercontent.com/Wi6gK1jePVm7QFS2-sTryh4fJIgVPxbGVpT5vgC34LuoO9e5Df88SfFZDXiI5E-z24_giA3P75A1QEvEopnrVl8R2oud6gE_GagoyUlWpzlKVmL1mClTa0T0D5LEh7ua_o6uIh0rz-KLoDoQ7mxhYYc', // Use URL instead of base64
        rating: 4.0,
        reviewsCount: 120,
        description: 'Đến với khu vui chơi Sài Gòn Đầm Sen, bạn sẽ được trải nghiệm nhiều trò chơi độc đáo, nhất là tham quan thuỷ cung và khu băng đăng tuyệt đẹp. Đặc biệt, khu công viên nước Đầm Sen còn thu hút cả người lớn và trẻ em với hệ thống cầu trượt hoành tráng có thể thách thức trái tim của những người dũng cảm.  ',
        facilities: {
          'Internet': true,
          'Parking': true,
          'Spa': true,
          'Swimming Pool': true,
        },
        price: 300000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel(
        id: '16',
        name: 'Khu Du Lịch Suối Tiên',
        imageUrl: 'https://lh7-us.googleusercontent.com/_KkaXvR0efLxmJA9IklpUI2qonyMWsC0C99xgGd3dlUpo7tj7OeR0cAWXZPlSWCtTQl6u2ScKmyaBrlYuBW0iUr0N036NC488Zhp5ZRWB-6tuZVkJoCdU3IrFteV0L2Mmr6o8HAHTqsga6cxGpcCMmg', // Use URL instead of base64
        rating: 4.0,
        reviewsCount: 120,
        description: 'Với rất nhiều sự kiện, lễ hội văn hoá và hệ thống trò chơi giải trí đặc sắc, Suối Tiên là một trong các địa điểm vui chơi ở TPHCM nổi tiếng. Không gian nơi đây được thiết kế theo chủ đề Long - Ly - Quy - Phụng ứng với Kim - Mộc - Thuỷ - Hoả, một sự kết hợp hoàn hảo giữa các yếu tố văn hóa - lịch sử - tâm linh - giải trí. Đến với khu vui chơi Suối Tiên, bạn không thể bỏ qua biển Tiên Đồng nổi tiếng với tượng Lạc Long Quân và Âu Cơ, cùng nhiều trò chơi dưới nước độc đáo. ',
        facilities: {
          'Internet': true,
          'Parking': true,
          'Spa': true,
          'Swimming Pool': true,
        },
        price: 200000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel(
        id: '17',
        name: 'Công viên cá Koi Rin Rin Park',
        imageUrl: 'https://lh7-us.googleusercontent.com/hi17QscxmQEpeqhwtFqITHOl393wElzvMlxZNwHucnRDeM-F-n1RLMHru6I8yfxGqApi-Cdq4HTkiDW2TlN2g7unIYWyK0PEVz_bf6Y4fmleDh7hPcCYBakT3rfW-nwbXQoTcuRFgwnRAvSbxwwJiXk', // Use URL instead of base64
        rating: 4.0,
        reviewsCount: 120,
        description: 'Công viên cá Koi Rin Rin Park có diện tích khoảng 20.000m2 với một khu vực hồ cá Koi lớn có hàng trăm con cá đủ sắc màu. Quanh công viên được trải đá xanh Nhật Bản iyo aoishi lớn nhỏ, kết hợp cùng nhiều cây Tùng La Hán tạo nên một khung cảnh lãng mạn và xinh đẹp. Ngoài ngắm cá, bạn còn có thể thuê trang phục Kimono để chụp ảnh. Nơi đây được xem là một trong những địa điểm vui chơi Sài Gòn lý tưởng.',
        facilities: {
          'Internet': true,
          'Parking': true,
          'Spa': true,
          'Swimming Pool': true,
        },
        price: 500000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),


    ];

    for (final entertainment in sampleEntertainment) {
      try {
        await addEntertainment(entertainment);
      } catch (e) {
        print('Error adding sample hotel with id: ${entertainment.id}: $e');
      }
    }
  }

  // Retrieve the list of hotels from Firestore
  Stream<List<DestinationModel>> getEntertainment() {
    return _firestore.collection('Entertainment').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DestinationModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
