import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_end/data/models/destination_model.dart';
class HotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Hàm thêm khách sạn vào Firestore
  Future<void> addHotel(DestinationModel hotel) async {
    await _firestore.collection('Resort').doc(hotel.id).set(hotel.toJson());
  }

  // Hàm thêm dữ liệu mẫu cho khách sạn vào Firestore nếu chưa có
  Future<void> addSampleHotels() async {
    final List<DestinationModel> hotels = [
      DestinationModel(
        id: '8',
        name: 'Resort Paradise',
        imageUrl: 'https://acihome.vn/wp-content/uploads/2020/02/thiet-ke-khach-san-4-sao-tai-hai-hoa-4-sao-ben-thanh-paradise-hotel-2.jpg',
        rating: 4.0,
        reviewsCount: 120,
        description: 'Luxurious hotel with beautiful sea views and excellent service.',
        facilities: {'Internet': true, 'Parking': true, 'Spa': true, 'Swimming Pool': true},
        price: 1500000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    DestinationModel
      (
    id: '9',
    name: 'Anantara Mũi né Resort',
    imageUrl: 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2023/2/3/1144009/Binh-Thuan-1.jpg',
    rating: 5.0,
    reviewsCount: 120,
    description: 'Anantara Resort gồm 70 phòng nghỉ theo tiêu chuẩn 5 sao được trang bị nội thất hiện đại. Các phòng và suite nằm trong tòa nhà chính, cùng các biệt thự bên hồ bơi nằm rải rác xung quanh những khu vườn xanh tốt. Giữa các phòng trong resort có tính kết nối cao, có thể liên thông ra đến sân vườn, lối đi có nhiều thảm thực vật, hồ bơi tạo cảm giác gần gũi với thiên nhiên xanh.',
    facilities: {'Internet': true, 'Parking': true, 'Spa': true, 'Swimming Pool': true,'Người đẹp':true},
    price: 1200000,
    currency: 'VND',
    location: {'latitude': 20.9876, 'longitude': 105.8765},
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    ),
      DestinationModel
        (
        id: '10',
        name: 'Fusion Suites Saigon',
        imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/square600/229288103.webp?k=9984a86932390ff4d27fc298609dd38ae0f0136547283699cdb08a61b5a82cf7&o=',
        rating: 4.5,
        reviewsCount: 120,
        description: 'Nằm trong bán kính 300 m từ Công viên Tao Đàn ở Quận 1, Fusion Suites Saigon cung cấp chỗ nghỉ hiện đại tại Thành phố Hồ Chí Minh nhộn nhịp.Đây là một trong những nơi nổi tiếng ở sài gòn.',
        facilities: {'Internet': true, 'Parking': true, 'Spa': true, 'Swimming Pool': true,'Người đẹp':true},
        price: 1600000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel
        (
        id: '11',
        name: 'InterContinental Danang Sun Peninsula Resort',
        imageUrl: 'https://cdn.tgdd.vn/Files/2022/02/07/1414227/7-khu-nghi-duong-dang-cap-sang-trong-bac-nhat-viet-nam-202202071047400279.jpg',
        rating: 4.5,
        reviewsCount: 120,
        description: 'Khu resort trong bức ảnh toát lên vẻ đẹp lộng lẫy và sang trọng giữa thiên nhiên xanh tươi. Với vị trí đắc địa nằm trên sườn đồi, khu nghỉ dưỡng nhìn ra bờ biển tuyệt đẹp, tạo nên một không gian mở hướng về thiên nhiên hoang sơ nhưng đầy tinh tế. Các tòa biệt thự và khu nhà nghỉ được xây dựng theo kiến trúc sang trọng với gam màu trắng nổi bật, hòa quyện với màu xanh của núi rừng và biển cả.',
        facilities: {'Internet': true, 'Parking': true, 'Spa': true, 'Swimming Pool': true,'Người đẹp':true},
        price: 1800000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel
        (
        id: '12',
        name: 'Banyan Tree Lăng Cô',
        imageUrl: 'https://www.banyantree.com/_next/image?url=https%3A%2F%2Fwww.banyantree.com%2Fassets%2F2021-10%2Fbt-langco-intro.jpg&w=1200&q=75',
        rating: 5.0,
        reviewsCount: 120,
        description: 'Tận hưởng một thiên đường của những giác quan tại Banyan Tree Lăng Cô, một khu nghỉ dưỡng biển với 72 căn biệt thự hạng sang, tất cả đều có hồ bơi riêng, nằm nép mình giữa biển Đông xanh ngắt và dãy Trường Sơn hùng vĩ.',
        facilities: {'Internet': true, 'Parking': true, 'Spa': true, 'Swimming Pool': true,'Người đẹp':true},
        price: 2000000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      DestinationModel
        (
        id: '13',
        name: 'JW Marriott Resort Hanoi ',
        imageUrl: 'https://vietair.com.vn/Media/Images/nguyenle3579(1).jpg?p=1&w=790',
        rating: 5.0,
        reviewsCount: 120,
        description: 'Nằm ở phía tây Hà Nội, với không gian vô cùng thoáng đãng, JW Marriott được nhiều du khách đánh giá cao về cảnh quan và kiến trúc hiện đại vô cùng ấn tượng. Khách sạn này nằm ở ngoại ô, chỉ mất 35 phút đi tới từ sân bay Nội Bài và ít khi gặp tắc đường. Thực đơn của khách sạn rất phong phú với các món ăn được phục vụ từ nhiều đầu bếp nổi tiếng Âu - Á.',
        facilities: {'Internet': true, 'Parking': true, 'Spa': true, 'Swimming Pool': true,'Người đẹp':true},
        price: 3000000,
        currency: 'VND',
        location: {'latitude': 20.9876, 'longitude': 105.8765},
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    for (final hotel in hotels) {
      try {
        await addHotel(hotel);
        print('Thêm thành công khách sạn với id: ${hotel.id}');
      } catch (e) {
        print('Lỗi khi thêm khách sạn với id: ${hotel.id}: $e');
      }
    }
  }

  // Lấy danh sách khách sạn từ Firestore
  Stream<List<DestinationModel>> getHotels() {
    return _firestore.collection('hotels').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DestinationModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}