import 'dart:typed_data';

import 'package:mmkv/mmkv.dart';
import 'dart:convert'; // 用于 Bytes 类型编解码

/// 安全存储服务类
/// 
/// 基于 MMKV 实现的高性能键值存储服务
/// 提供多种数据类型的存储和读取功能
/// 使用单例模式确保全局唯一实例
class SecureStorageService {
  /// 单例实例
  static final SecureStorageService instance = SecureStorageService._internal();
  
  /// 工厂构造函数，返回单例实例
  factory SecureStorageService() => instance;

  /// MMKV 实例
  late MMKV _mmkv;

  /// 私有构造函数，初始化 MMKV
  SecureStorageService._internal() {
    MMKV.initialize(); // 确保 MMKV 已初始化
    _mmkv = MMKV.defaultMMKV();
  }

  //------------------------------- 数据类型封装 -------------------------------
  
  /// 存储布尔值
  /// 
  /// [key] 存储键
  /// [value] 要存储的布尔值
  Future<void> setBool(String key, bool value) async {
    await _mmkv.encodeBool(key, value);
  }

  /// 获取布尔值
  /// 
  /// [key] 存储键
  /// 返回存储的布尔值，如果不存在则返回 null
  Future<bool?> getBool(String key) async {
    return _mmkv.decodeBool(key);
  }

  /// 存储32位整数
  /// 
  /// [key] 存储键
  /// [value] 要存储的32位整数
  Future<void> setInt32(String key, int value) async {
    await _mmkv.encodeInt32(key, value);
  }

  /// 获取32位整数
  /// 
  /// [key] 存储键
  /// 返回存储的32位整数，如果不存在则返回 null
  Future<int?> getInt32(String key) async {
    return _mmkv.decodeInt32(key);
  }

  /// 存储64位整数
  /// 
  /// [key] 存储键
  /// [value] 要存储的64位整数
  Future<void> setInt(String key, int value) async {
    await _mmkv.encodeInt(key, value);
  }

  /// 获取64位整数
  /// 
  /// [key] 存储键
  /// 返回存储的64位整数，如果不存在则返回 null
  Future<int?> getInt(String key) async {
    return _mmkv.decodeInt(key);
  }

  /// 存储字符串
  /// 
  /// [key] 存储键
  /// [value] 要存储的字符串
  Future<void> setString(String key, String value) async {
    await _mmkv.encodeString(key, value);
  }

  /// 获取字符串
  /// 
  /// [key] 存储键
  /// 返回存储的字符串，如果不存在则返回 null
  Future<String?> getString(String key) async {
    return _mmkv.decodeString(key);
  }

  /// 存储二进制数据
  /// 
  /// [key] 存储键
  /// [bytes] 要存储的二进制数据
  /// 
  /// 注意：使用完后会自动销毁内存缓冲区
  Future<void> setBytes(String key, Uint8List bytes) async {
    final buffer = MMBuffer.fromList(bytes)!;
    await _mmkv.encodeBytes(key, buffer);
    buffer.destroy(); // 必须手动销毁内存
  }

  /// 获取二进制数据
  /// 
  /// [key] 存储键
  /// 返回存储的二进制数据，如果不存在则返回 null
  /// 
  /// 注意：使用完后会自动销毁内存缓冲区
  Future<Uint8List?> getBytes(String key) async {
    final buffer = _mmkv.decodeBytes(key);
    if (buffer == null) return null;
    final bytes = buffer.asList()!;
    buffer.destroy(); // 必须手动销毁内存
    return Uint8List.fromList(bytes);
  }

  //------------------------------- 通用操作 -------------------------------
  
  /// 删除指定键的数据
  /// 
  /// [key] 要删除的存储键
  Future<void> delete(String key) async {
    _mmkv.removeValue(key);
  }

  /// 删除所有存储的数据
  /// 
  /// 注意：此操作会清空所有存储的数据，请谨慎使用
  Future<void> deleteAll() async {
    final allKeys = _mmkv.allKeys;
    for (var key in allKeys) {
       _mmkv.removeValue(key);
    }
  }
}