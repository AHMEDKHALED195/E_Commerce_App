import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(path).add(data);
  }
}
