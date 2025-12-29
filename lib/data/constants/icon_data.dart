/// 图标数据常量定义
///
/// 图标存储格式说明：
/// - emoji:<unicode> - Emoji表情，如 emoji:1f600 (😀)
/// - material:<icon_name> - Material图标，如 material:account_balance
/// - flag:<country_code> - 国旗图标，如 flag:CN
///
/// 示例：
/// - 货币人民币图标：flag:CN 或 emoji:1f1e8-1f1f3
/// - 账户钱包图标：emoji:1f4b0 或 material:wallet
library;

import 'package:flutter/material.dart';

/// 图标类型枚举
enum IconType { emoji, material, flag }

/// 图标数据类
class AppIcon {
  final IconType type;
  final String value;

  const AppIcon({required this.type, required this.value});

  /// 从存储格式字符串解析
  factory AppIcon.fromString(String str) {
    if (str.isEmpty) {
      return const AppIcon(type: IconType.material, value: 'help_outline');
    }

    final parts = str.split(':');
    if (parts.length != 2) {
      return const AppIcon(type: IconType.material, value: 'help_outline');
    }

    final typeStr = parts[0];
    final value = parts[1];

    switch (typeStr) {
      case 'emoji':
        return AppIcon(type: IconType.emoji, value: value);
      case 'material':
        return AppIcon(type: IconType.material, value: value);
      case 'flag':
        return AppIcon(type: IconType.flag, value: value);
      default:
        return AppIcon(type: IconType.material, value: value);
    }
  }

  /// 转换为存储格式字符串
  String toStorageString() {
    switch (type) {
      case IconType.emoji:
        return 'emoji:$value';
      case IconType.material:
        return 'material:$value';
      case IconType.flag:
        return 'flag:$value';
    }
  }

  /// 获取Emoji字符
  String? get emojiChar {
    if (type != IconType.emoji) return null;
    try {
      final codePoints = value
          .split('-')
          .map((s) => int.parse(s, radix: 16))
          .toList();
      return String.fromCharCodes(codePoints);
    } catch (_) {
      return null;
    }
  }

  /// 获取Material图标
  IconData? get materialIcon {
    if (type != IconType.material) return null;
    return materialIconsMap[value];
  }

  @override
  String toString() => toStorageString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppIcon &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          value == other.value;

  @override
  int get hashCode => type.hashCode ^ value.hashCode;
}

/// Material图标映射表
const Map<String, IconData> materialIconsMap = {
  // 通用
  'help_outline': Icons.help_outline,
  'star': Icons.star,
  'favorite': Icons.favorite,
  'home': Icons.home,
  'settings': Icons.settings,

  // 财务相关
  'account_balance': Icons.account_balance,
  'account_balance_wallet': Icons.account_balance_wallet,
  'wallet': Icons.wallet,
  'credit_card': Icons.credit_card,
  'savings': Icons.savings,
  'attach_money': Icons.attach_money,
  'money': Icons.money,
  'payments': Icons.payments,
  'currency_exchange': Icons.currency_exchange,
  'paid': Icons.paid,
  'price_change': Icons.price_change,
  'trending_up': Icons.trending_up,
  'trending_down': Icons.trending_down,
  'show_chart': Icons.show_chart,
  'pie_chart': Icons.pie_chart,
  'bar_chart': Icons.bar_chart,
  'receipt': Icons.receipt,
  'receipt_long': Icons.receipt_long,

  // 购物
  'shopping_cart': Icons.shopping_cart,
  'shopping_bag': Icons.shopping_bag,
  'store': Icons.store,
  'storefront': Icons.storefront,
  'local_mall': Icons.local_mall,
  'local_offer': Icons.local_offer,
  'sell': Icons.sell,

  // 餐饮
  'restaurant': Icons.restaurant,
  'restaurant_menu': Icons.restaurant_menu,
  'local_dining': Icons.local_dining,
  'fastfood': Icons.fastfood,
  'local_cafe': Icons.local_cafe,
  'local_bar': Icons.local_bar,
  'local_pizza': Icons.local_pizza,
  'bakery_dining': Icons.bakery_dining,
  'lunch_dining': Icons.lunch_dining,
  'dinner_dining': Icons.dinner_dining,
  'breakfast_dining': Icons.breakfast_dining,
  'coffee': Icons.coffee,
  'local_grocery_store': Icons.local_grocery_store,

  // 交通
  'directions_car': Icons.directions_car,
  'local_taxi': Icons.local_taxi,
  'directions_bus': Icons.directions_bus,
  'train': Icons.train,
  'flight': Icons.flight,
  'local_shipping': Icons.local_shipping,
  'two_wheeler': Icons.two_wheeler,
  'electric_bike': Icons.electric_bike,
  'electric_car': Icons.electric_car,
  'local_gas_station': Icons.local_gas_station,
  'local_parking': Icons.local_parking,
  'ev_station': Icons.ev_station,

  // 住房
  'house': Icons.house,
  'apartment': Icons.apartment,
  'cottage': Icons.cottage,
  'villa': Icons.villa,
  'hotel': Icons.hotel,
  'bed': Icons.bed,
  'chair': Icons.chair,
  'kitchen': Icons.kitchen,
  'bathroom': Icons.bathroom,
  'weekend': Icons.weekend,

  // 公用事业
  'power': Icons.power,
  'water_drop': Icons.water_drop,
  'gas_meter': Icons.gas_meter,
  'electric_meter': Icons.electric_meter,
  'wifi': Icons.wifi,
  'phone': Icons.phone,
  'smartphone': Icons.smartphone,
  'router': Icons.router,
  'tv': Icons.tv,

  // 健康
  'local_hospital': Icons.local_hospital,
  'medical_services': Icons.medical_services,
  'medication': Icons.medication,
  'health_and_safety': Icons.health_and_safety,
  'fitness_center': Icons.fitness_center,
  'sports': Icons.sports,
  'sports_gymnastics': Icons.sports_gymnastics,
  'spa': Icons.spa,
  'self_improvement': Icons.self_improvement,

  // 教育
  'school': Icons.school,
  'book': Icons.book,
  'menu_book': Icons.menu_book,
  'auto_stories': Icons.auto_stories,
  'library_books': Icons.library_books,
  'science': Icons.science,
  'calculate': Icons.calculate,
  'translate': Icons.translate,
  'history_edu': Icons.history_edu,

  // 娱乐
  'movie': Icons.movie,
  'theaters': Icons.theaters,
  'music_note': Icons.music_note,
  'headphones': Icons.headphones,
  'videogame_asset': Icons.videogame_asset,
  'sports_esports': Icons.sports_esports,
  'casino': Icons.casino,
  'celebration': Icons.celebration,
  'park': Icons.park,
  'attractions': Icons.attractions,

  // 宠物
  'pets': Icons.pets,

  // 礼物
  'card_giftcard': Icons.card_giftcard,
  'redeem': Icons.redeem,
  'cake': Icons.cake,

  // 工作
  'work': Icons.work,
  'business': Icons.business,
  'business_center': Icons.business_center,
  'laptop': Icons.laptop,
  'computer': Icons.computer,
  'print': Icons.print,

  // 其他
  'category': Icons.category,
  'label': Icons.label,
  'bookmark': Icons.bookmark,
  'flag': Icons.flag,
  'more_horiz': Icons.more_horiz,
  'add': Icons.add,
  'remove': Icons.remove,
  'check': Icons.check,
  'close': Icons.close,
  'edit': Icons.edit,
  'delete': Icons.delete,
  'search': Icons.search,
  'filter_list': Icons.filter_list,
  'sort': Icons.sort,
  'refresh': Icons.refresh,
  'sync': Icons.sync,
  'cloud': Icons.cloud,
  'cloud_upload': Icons.cloud_upload,
  'cloud_download': Icons.cloud_download,
  'backup': Icons.backup,
  'restore': Icons.restore,
  'security': Icons.security,
  'lock': Icons.lock,
  'vpn_key': Icons.vpn_key,
  'visibility': Icons.visibility,
  'visibility_off': Icons.visibility_off,
};

/// 图标分类数据
class IconCategory {
  final String id;
  final String name;
  final IconData icon;
  final List<String> iconKeys;

  const IconCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconKeys,
  });
}

/// 预定义的Material图标分类
const List<IconCategory> materialIconCategories = [
  IconCategory(
    id: 'finance',
    name: '财务',
    icon: Icons.account_balance_wallet,
    iconKeys: [
      'account_balance',
      'account_balance_wallet',
      'wallet',
      'credit_card',
      'savings',
      'attach_money',
      'money',
      'payments',
      'currency_exchange',
      'paid',
      'price_change',
      'trending_up',
      'trending_down',
      'show_chart',
      'pie_chart',
      'bar_chart',
      'receipt',
      'receipt_long',
    ],
  ),
  IconCategory(
    id: 'shopping',
    name: '购物',
    icon: Icons.shopping_cart,
    iconKeys: [
      'shopping_cart',
      'shopping_bag',
      'store',
      'storefront',
      'local_mall',
      'local_offer',
      'sell',
    ],
  ),
  IconCategory(
    id: 'food',
    name: '餐饮',
    icon: Icons.restaurant,
    iconKeys: [
      'restaurant',
      'restaurant_menu',
      'local_dining',
      'fastfood',
      'local_cafe',
      'local_bar',
      'local_pizza',
      'bakery_dining',
      'lunch_dining',
      'dinner_dining',
      'breakfast_dining',
      'coffee',
      'local_grocery_store',
    ],
  ),
  IconCategory(
    id: 'transport',
    name: '交通',
    icon: Icons.directions_car,
    iconKeys: [
      'directions_car',
      'local_taxi',
      'directions_bus',
      'train',
      'flight',
      'local_shipping',
      'two_wheeler',
      'electric_bike',
      'electric_car',
      'local_gas_station',
      'local_parking',
      'ev_station',
    ],
  ),
  IconCategory(
    id: 'housing',
    name: '住房',
    icon: Icons.home,
    iconKeys: [
      'house',
      'apartment',
      'cottage',
      'villa',
      'hotel',
      'bed',
      'chair',
      'kitchen',
      'bathroom',
      'weekend',
      'home',
    ],
  ),
  IconCategory(
    id: 'utilities',
    name: '公用事业',
    icon: Icons.power,
    iconKeys: [
      'power',
      'water_drop',
      'gas_meter',
      'electric_meter',
      'wifi',
      'phone',
      'smartphone',
      'router',
      'tv',
    ],
  ),
  IconCategory(
    id: 'health',
    name: '健康',
    icon: Icons.favorite,
    iconKeys: [
      'local_hospital',
      'medical_services',
      'medication',
      'health_and_safety',
      'fitness_center',
      'sports',
      'sports_gymnastics',
      'spa',
      'self_improvement',
    ],
  ),
  IconCategory(
    id: 'education',
    name: '教育',
    icon: Icons.school,
    iconKeys: [
      'school',
      'book',
      'menu_book',
      'auto_stories',
      'library_books',
      'science',
      'calculate',
      'translate',
      'history_edu',
    ],
  ),
  IconCategory(
    id: 'entertainment',
    name: '娱乐',
    icon: Icons.movie,
    iconKeys: [
      'movie',
      'theaters',
      'music_note',
      'headphones',
      'videogame_asset',
      'sports_esports',
      'casino',
      'celebration',
      'park',
      'attractions',
    ],
  ),
  IconCategory(
    id: 'other',
    name: '其他',
    icon: Icons.more_horiz,
    iconKeys: [
      'pets',
      'card_giftcard',
      'redeem',
      'cake',
      'work',
      'business',
      'business_center',
      'laptop',
      'computer',
      'print',
      'category',
      'label',
      'bookmark',
      'flag',
      'star',
      'favorite',
    ],
  ),
];
