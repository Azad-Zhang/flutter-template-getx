import 'dart:typed_data';

import 'package:mmkv/mmkv.dart';
import 'dart:convert'; // 用于 Bytes 类型编解码

class SecureStorageService {
  static final SecureStorageService instance = SecureStorageService._internal();
  factory SecureStorageService() => instance;

  late MMKV _mmkv;

  SecureStorageService._internal() {
    MMKV.initialize(); // 确保 MMKV 已初始化
    _mmkv = MMKV.defaultMMKV();
  }

  //------------------------------- 数据类型封装 -------------------------------
  // 1. Boolean 类型
  Future<void> setBool(String key, bool value) async {
    await _mmkv.encodeBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return _mmkv.decodeBool(key);
  }

  // 2. 32位整数 (int32)
  Future<void> setInt32(String key, int value) async {
    await _mmkv.encodeInt32(key, value);
  }

  Future<int?> getInt32(String key) async {
    return _mmkv.decodeInt32(key);
  }

  // 3. 64位整数 (int)
  Future<void> setInt(String key, int value) async {
    await _mmkv.encodeInt(key, value);
  }

  Future<int?> getInt(String key) async {
    return _mmkv.decodeInt(key);
  }

  // 4. String 类型
  Future<void> setString(String key, String value) async {
    await _mmkv.encodeString(key, value);
  }

  Future<String?> getString(String key) async {
    return _mmkv.decodeString(key);
  }

  // 5. Bytes 类型 (二进制数据)
  Future<void> setBytes(String key, Uint8List bytes) async {
    final buffer = MMBuffer.fromList(bytes)!;
    await _mmkv.encodeBytes(key, buffer);
    buffer.destroy(); // 必须手动销毁内存
  }

  Future<Uint8List?> getBytes(String key) async {
    final buffer = _mmkv.decodeBytes(key);
    if (buffer == null) return null;
    final bytes = buffer.asList()!;
    buffer.destroy(); // 必须手动销毁内存
    return Uint8List.fromList(bytes);
  }

  //------------------------------- 通用操作 -------------------------------
  Future<void> delete(String key) async {
    _mmkv.removeValue(key);
  }

  Future<void> deleteAll() async {
    final allKeys = _mmkv.allKeys;
    for (var key in allKeys) {
       _mmkv.removeValue(key);
    }
  }
}