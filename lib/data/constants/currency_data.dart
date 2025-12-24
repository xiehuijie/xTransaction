/// 货币数据常量
/// 
/// 基于 ISO 4217 标准的世界主流货币数据
/// 数据源：sealed_currencies 库 + 手动补充

import 'package:flutter/material.dart';

/// 系统预设货币模板
class CurrencyTemplate {
  /// ISO 4217 货币代码
  final String code;
  
  /// 货币名称（中文）
  final String nameCN;
  
  /// 货币名称（英文）
  final String nameEN;
  
  /// 货币符号
  final String symbol;
  
  /// 小数位数
  final int decimal;
  
  /// 符号位置：true=前缀，false=后缀
  final bool symbolPrefix;
  
  /// 国家/地区代码（用于显示国旗）
  final String? countryCode;
  
  /// 是否为主流货币
  final bool isPopular;

  const CurrencyTemplate({
    required this.code,
    required this.nameCN,
    required this.nameEN,
    required this.symbol,
    this.decimal = 2,
    this.symbolPrefix = true,
    this.countryCode,
    this.isPopular = false,
  });

  /// 获取图标存储格式
  String get iconString {
    if (countryCode != null) {
      return 'flag:$countryCode';
    }
    return 'emoji:1f4b0'; // 默认使用钱袋emoji
  }
}

/// 世界主流货币列表（按使用频率排序）
const List<CurrencyTemplate> worldCurrencies = [
  // 主要货币
  CurrencyTemplate(
    code: 'CNY',
    nameCN: '人民币',
    nameEN: 'Chinese Yuan',
    symbol: '¥',
    countryCode: 'CN',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'USD',
    nameCN: '美元',
    nameEN: 'US Dollar',
    symbol: '\$',
    countryCode: 'US',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'EUR',
    nameCN: '欧元',
    nameEN: 'Euro',
    symbol: '€',
    countryCode: 'EU',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'JPY',
    nameCN: '日元',
    nameEN: 'Japanese Yen',
    symbol: '¥',
    decimal: 0,
    countryCode: 'JP',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'GBP',
    nameCN: '英镑',
    nameEN: 'British Pound',
    symbol: '£',
    countryCode: 'GB',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'HKD',
    nameCN: '港元',
    nameEN: 'Hong Kong Dollar',
    symbol: 'HK\$',
    countryCode: 'HK',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'TWD',
    nameCN: '新台币',
    nameEN: 'New Taiwan Dollar',
    symbol: 'NT\$',
    countryCode: 'TW',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'KRW',
    nameCN: '韩元',
    nameEN: 'South Korean Won',
    symbol: '₩',
    decimal: 0,
    countryCode: 'KR',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'SGD',
    nameCN: '新加坡元',
    nameEN: 'Singapore Dollar',
    symbol: 'S\$',
    countryCode: 'SG',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'AUD',
    nameCN: '澳元',
    nameEN: 'Australian Dollar',
    symbol: 'A\$',
    countryCode: 'AU',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'CAD',
    nameCN: '加元',
    nameEN: 'Canadian Dollar',
    symbol: 'C\$',
    countryCode: 'CA',
    isPopular: true,
  ),
  CurrencyTemplate(
    code: 'CHF',
    nameCN: '瑞士法郎',
    nameEN: 'Swiss Franc',
    symbol: 'CHF',
    countryCode: 'CH',
    isPopular: true,
  ),
  
  // 亚洲货币
  CurrencyTemplate(
    code: 'MOP',
    nameCN: '澳门元',
    nameEN: 'Macanese Pataca',
    symbol: 'MOP\$',
    countryCode: 'MO',
  ),
  CurrencyTemplate(
    code: 'THB',
    nameCN: '泰铢',
    nameEN: 'Thai Baht',
    symbol: '฿',
    countryCode: 'TH',
  ),
  CurrencyTemplate(
    code: 'MYR',
    nameCN: '马来西亚林吉特',
    nameEN: 'Malaysian Ringgit',
    symbol: 'RM',
    countryCode: 'MY',
  ),
  CurrencyTemplate(
    code: 'IDR',
    nameCN: '印尼盾',
    nameEN: 'Indonesian Rupiah',
    symbol: 'Rp',
    decimal: 0,
    countryCode: 'ID',
  ),
  CurrencyTemplate(
    code: 'PHP',
    nameCN: '菲律宾比索',
    nameEN: 'Philippine Peso',
    symbol: '₱',
    countryCode: 'PH',
  ),
  CurrencyTemplate(
    code: 'VND',
    nameCN: '越南盾',
    nameEN: 'Vietnamese Dong',
    symbol: '₫',
    decimal: 0,
    countryCode: 'VN',
  ),
  CurrencyTemplate(
    code: 'INR',
    nameCN: '印度卢比',
    nameEN: 'Indian Rupee',
    symbol: '₹',
    countryCode: 'IN',
  ),
  CurrencyTemplate(
    code: 'PKR',
    nameCN: '巴基斯坦卢比',
    nameEN: 'Pakistani Rupee',
    symbol: '₨',
    countryCode: 'PK',
  ),
  CurrencyTemplate(
    code: 'BDT',
    nameCN: '孟加拉塔卡',
    nameEN: 'Bangladeshi Taka',
    symbol: '৳',
    countryCode: 'BD',
  ),
  CurrencyTemplate(
    code: 'LKR',
    nameCN: '斯里兰卡卢比',
    nameEN: 'Sri Lankan Rupee',
    symbol: 'Rs',
    countryCode: 'LK',
  ),
  CurrencyTemplate(
    code: 'NPR',
    nameCN: '尼泊尔卢比',
    nameEN: 'Nepalese Rupee',
    symbol: 'Rs',
    countryCode: 'NP',
  ),
  CurrencyTemplate(
    code: 'MMK',
    nameCN: '缅甸元',
    nameEN: 'Myanmar Kyat',
    symbol: 'K',
    decimal: 0,
    countryCode: 'MM',
  ),
  CurrencyTemplate(
    code: 'KHR',
    nameCN: '柬埔寨瑞尔',
    nameEN: 'Cambodian Riel',
    symbol: '៛',
    countryCode: 'KH',
  ),
  CurrencyTemplate(
    code: 'LAK',
    nameCN: '老挝基普',
    nameEN: 'Lao Kip',
    symbol: '₭',
    decimal: 0,
    countryCode: 'LA',
  ),
  CurrencyTemplate(
    code: 'BND',
    nameCN: '文莱元',
    nameEN: 'Brunei Dollar',
    symbol: 'B\$',
    countryCode: 'BN',
  ),
  
  // 中东货币
  CurrencyTemplate(
    code: 'AED',
    nameCN: '阿联酋迪拉姆',
    nameEN: 'UAE Dirham',
    symbol: 'د.إ',
    countryCode: 'AE',
  ),
  CurrencyTemplate(
    code: 'SAR',
    nameCN: '沙特里亚尔',
    nameEN: 'Saudi Riyal',
    symbol: '﷼',
    countryCode: 'SA',
  ),
  CurrencyTemplate(
    code: 'QAR',
    nameCN: '卡塔尔里亚尔',
    nameEN: 'Qatari Riyal',
    symbol: '﷼',
    countryCode: 'QA',
  ),
  CurrencyTemplate(
    code: 'KWD',
    nameCN: '科威特第纳尔',
    nameEN: 'Kuwaiti Dinar',
    symbol: 'د.ك',
    decimal: 3,
    countryCode: 'KW',
  ),
  CurrencyTemplate(
    code: 'BHD',
    nameCN: '巴林第纳尔',
    nameEN: 'Bahraini Dinar',
    symbol: '.د.ب',
    decimal: 3,
    countryCode: 'BH',
  ),
  CurrencyTemplate(
    code: 'OMR',
    nameCN: '阿曼里亚尔',
    nameEN: 'Omani Rial',
    symbol: '﷼',
    decimal: 3,
    countryCode: 'OM',
  ),
  CurrencyTemplate(
    code: 'ILS',
    nameCN: '以色列新谢克尔',
    nameEN: 'Israeli Shekel',
    symbol: '₪',
    countryCode: 'IL',
  ),
  CurrencyTemplate(
    code: 'TRY',
    nameCN: '土耳其里拉',
    nameEN: 'Turkish Lira',
    symbol: '₺',
    countryCode: 'TR',
  ),
  
  // 欧洲货币（非欧元区）
  CurrencyTemplate(
    code: 'RUB',
    nameCN: '俄罗斯卢布',
    nameEN: 'Russian Ruble',
    symbol: '₽',
    countryCode: 'RU',
  ),
  CurrencyTemplate(
    code: 'PLN',
    nameCN: '波兰兹罗提',
    nameEN: 'Polish Zloty',
    symbol: 'zł',
    countryCode: 'PL',
  ),
  CurrencyTemplate(
    code: 'CZK',
    nameCN: '捷克克朗',
    nameEN: 'Czech Koruna',
    symbol: 'Kč',
    countryCode: 'CZ',
  ),
  CurrencyTemplate(
    code: 'HUF',
    nameCN: '匈牙利福林',
    nameEN: 'Hungarian Forint',
    symbol: 'Ft',
    decimal: 0,
    countryCode: 'HU',
  ),
  CurrencyTemplate(
    code: 'SEK',
    nameCN: '瑞典克朗',
    nameEN: 'Swedish Krona',
    symbol: 'kr',
    countryCode: 'SE',
  ),
  CurrencyTemplate(
    code: 'NOK',
    nameCN: '挪威克朗',
    nameEN: 'Norwegian Krone',
    symbol: 'kr',
    countryCode: 'NO',
  ),
  CurrencyTemplate(
    code: 'DKK',
    nameCN: '丹麦克朗',
    nameEN: 'Danish Krone',
    symbol: 'kr',
    countryCode: 'DK',
  ),
  CurrencyTemplate(
    code: 'ISK',
    nameCN: '冰岛克朗',
    nameEN: 'Icelandic Króna',
    symbol: 'kr',
    decimal: 0,
    countryCode: 'IS',
  ),
  CurrencyTemplate(
    code: 'RON',
    nameCN: '罗马尼亚列伊',
    nameEN: 'Romanian Leu',
    symbol: 'lei',
    countryCode: 'RO',
  ),
  CurrencyTemplate(
    code: 'BGN',
    nameCN: '保加利亚列弗',
    nameEN: 'Bulgarian Lev',
    symbol: 'лв',
    countryCode: 'BG',
  ),
  CurrencyTemplate(
    code: 'HRK',
    nameCN: '克罗地亚库纳',
    nameEN: 'Croatian Kuna',
    symbol: 'kn',
    countryCode: 'HR',
  ),
  CurrencyTemplate(
    code: 'UAH',
    nameCN: '乌克兰格里夫纳',
    nameEN: 'Ukrainian Hryvnia',
    symbol: '₴',
    countryCode: 'UA',
  ),
  
  // 美洲货币
  CurrencyTemplate(
    code: 'MXN',
    nameCN: '墨西哥比索',
    nameEN: 'Mexican Peso',
    symbol: '\$',
    countryCode: 'MX',
  ),
  CurrencyTemplate(
    code: 'BRL',
    nameCN: '巴西雷亚尔',
    nameEN: 'Brazilian Real',
    symbol: 'R\$',
    countryCode: 'BR',
  ),
  CurrencyTemplate(
    code: 'ARS',
    nameCN: '阿根廷比索',
    nameEN: 'Argentine Peso',
    symbol: '\$',
    countryCode: 'AR',
  ),
  CurrencyTemplate(
    code: 'CLP',
    nameCN: '智利比索',
    nameEN: 'Chilean Peso',
    symbol: '\$',
    decimal: 0,
    countryCode: 'CL',
  ),
  CurrencyTemplate(
    code: 'COP',
    nameCN: '哥伦比亚比索',
    nameEN: 'Colombian Peso',
    symbol: '\$',
    countryCode: 'CO',
  ),
  CurrencyTemplate(
    code: 'PEN',
    nameCN: '秘鲁索尔',
    nameEN: 'Peruvian Sol',
    symbol: 'S/',
    countryCode: 'PE',
  ),
  
  // 非洲货币
  CurrencyTemplate(
    code: 'ZAR',
    nameCN: '南非兰特',
    nameEN: 'South African Rand',
    symbol: 'R',
    countryCode: 'ZA',
  ),
  CurrencyTemplate(
    code: 'EGP',
    nameCN: '埃及镑',
    nameEN: 'Egyptian Pound',
    symbol: 'E£',
    countryCode: 'EG',
  ),
  CurrencyTemplate(
    code: 'NGN',
    nameCN: '尼日利亚奈拉',
    nameEN: 'Nigerian Naira',
    symbol: '₦',
    countryCode: 'NG',
  ),
  CurrencyTemplate(
    code: 'KES',
    nameCN: '肯尼亚先令',
    nameEN: 'Kenyan Shilling',
    symbol: 'KSh',
    countryCode: 'KE',
  ),
  CurrencyTemplate(
    code: 'MAD',
    nameCN: '摩洛哥迪拉姆',
    nameEN: 'Moroccan Dirham',
    symbol: 'د.م.',
    countryCode: 'MA',
  ),
  
  // 大洋洲货币
  CurrencyTemplate(
    code: 'NZD',
    nameCN: '新西兰元',
    nameEN: 'New Zealand Dollar',
    symbol: 'NZ\$',
    countryCode: 'NZ',
  ),
  CurrencyTemplate(
    code: 'FJD',
    nameCN: '斐济元',
    nameEN: 'Fijian Dollar',
    symbol: 'FJ\$',
    countryCode: 'FJ',
  ),
];

/// 获取主流货币列表
List<CurrencyTemplate> get popularCurrencies =>
    worldCurrencies.where((c) => c.isPopular).toList();

/// 根据货币代码查找货币模板
CurrencyTemplate? findCurrencyByCode(String code) {
  try {
    return worldCurrencies.firstWhere((c) => c.code == code);
  } catch (_) {
    return null;
  }
}

/// 货币分组（按地区）
class CurrencyRegion {
  final String id;
  final String name;
  final IconData icon;
  final List<String> currencyCodes;

  const CurrencyRegion({
    required this.id,
    required this.name,
    required this.icon,
    required this.currencyCodes,
  });
}

const List<CurrencyRegion> currencyRegions = [
  CurrencyRegion(
    id: 'popular',
    name: '常用',
    icon: Icons.star,
    currencyCodes: ['CNY', 'USD', 'EUR', 'JPY', 'GBP', 'HKD', 'TWD', 'KRW', 'SGD', 'AUD', 'CAD', 'CHF'],
  ),
  CurrencyRegion(
    id: 'asia',
    name: '亚洲',
    icon: Icons.public,
    currencyCodes: ['CNY', 'JPY', 'KRW', 'HKD', 'TWD', 'SGD', 'MOP', 'THB', 'MYR', 'IDR', 'PHP', 'VND', 'INR', 'PKR', 'BDT', 'LKR', 'NPR', 'MMK', 'KHR', 'LAK', 'BND'],
  ),
  CurrencyRegion(
    id: 'middleeast',
    name: '中东',
    icon: Icons.landscape,
    currencyCodes: ['AED', 'SAR', 'QAR', 'KWD', 'BHD', 'OMR', 'ILS', 'TRY'],
  ),
  CurrencyRegion(
    id: 'europe',
    name: '欧洲',
    icon: Icons.castle,
    currencyCodes: ['EUR', 'GBP', 'CHF', 'RUB', 'PLN', 'CZK', 'HUF', 'SEK', 'NOK', 'DKK', 'ISK', 'RON', 'BGN', 'HRK', 'UAH'],
  ),
  CurrencyRegion(
    id: 'americas',
    name: '美洲',
    icon: Icons.flag,
    currencyCodes: ['USD', 'CAD', 'MXN', 'BRL', 'ARS', 'CLP', 'COP', 'PEN'],
  ),
  CurrencyRegion(
    id: 'africa',
    name: '非洲',
    icon: Icons.terrain,
    currencyCodes: ['ZAR', 'EGP', 'NGN', 'KES', 'MAD'],
  ),
  CurrencyRegion(
    id: 'oceania',
    name: '大洋洲',
    icon: Icons.waves,
    currencyCodes: ['AUD', 'NZD', 'FJD'],
  ),
];
