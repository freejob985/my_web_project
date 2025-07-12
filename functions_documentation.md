# توثيق الدوال - Functions Documentation

## نظرة عامة - Overview

هذا المستند يوثق جميع الدوال الرئيسية المستخدمة في مشروع لوحة تحكم  مع شرح للمدخلات والمخرجات المتوقعة لكل دالة.

## الدوال الرئيسية - Main Functions

### main.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `main()` | نقطة دخول التطبيق | لا شيء | تشغيل التطبيق |
| `MyApp.build()` | بناء هيكل التطبيق الرئيسي | BuildContext | Widget |

### providers/menu_provider.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `MenuProvider.of()` | الحصول على مثيل مزود القائمة | BuildContext | MenuProvider |
| `setSelectedIndex()` | تعيين العنصر المحدد في القائمة | int | void |
| `toggleExpanded()` | تبديل حالة توسيع عنصر القائمة | int | void |

### providers/dashboard_provider.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `DashboardProvider.of()` | الحصول على مثيل مزود لوحة التحكم | BuildContext | DashboardProvider |

### screens/main_layout.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `MainLayout.build()` | بناء تخطيط الشاشة الرئيسية | BuildContext | Widget |
| `_changeScreen()` | تغيير الشاشة الحالية | Widget, String | void |

### screens/dashboard_screen.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `DashboardScreen.build()` | بناء شاشة لوحة التحكم | BuildContext | Widget |
| `_buildStatsRow()` | بناء صف بطاقات الإحصائيات | DashboardProvider | Widget |
| `_buildChartsSection()` | بناء قسم الرسوم البيانية | DashboardProvider | Widget |

### widgets/sidebar.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `Sidebar.build()` | بناء الشريط الجانبي | BuildContext | Widget |
| `_buildMenuItem()` | بناء عنصر قائمة | BuildContext, MenuItem, int | Widget |

### widgets/top_bar.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `TopBar.build()` | بناء الشريط العلوي | BuildContext | Widget |

### widgets/stat_card.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `StatCard.build()` | بناء بطاقة إحصائية | BuildContext | Widget |

### widgets/region_chart.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `RegionChart.build()` | بناء رسم بياني للمناطق | BuildContext | Widget |

### widgets/property_type_chart.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `PropertyTypeChart.build()` | بناء رسم بياني لأنواع العقارات | BuildContext | Widget |
| `_generatePieSections()` | إنشاء أقسام الرسم البياني الدائري | لا شيء | List<PieChartSectionData> |

## دوال المساعدة - Helper Functions

### constants/app_colors.dart

يحتوي على ثوابت الألوان المستخدمة في التطبيق.

### constants/app_strings.dart

يحتوي على ثوابت النصوص المستخدمة في التطبيق.

### constants/app_theme.dart

| الدالة | الوصف | المدخلات | المخرجات |
|--------|-------|----------|----------|
| `AppTheme.lightTheme` | الحصول على سمة الوضع الفاتح | لا شيء | ThemeData |

## تدفق البيانات - Data Flow

1. يبدأ التطبيق بتنفيذ دالة `main()`
2. يتم إنشاء مثيلات من مزودي الحالة `MenuProvider` و `DashboardProvider`
3. يتم بناء الواجهة الرئيسية `MainLayout`
4. يتم عرض الشريط الجانبي `Sidebar` والشريط العلوي `TopBar` ومحتوى لوحة التحكم `DashboardScreen`
5. تعرض شاشة لوحة التحكم بطاقات الإحصائيات والرسوم البيانية
6. عند تفاعل المستخدم مع القائمة، يتم تحديث حالة `MenuProvider` وتحديث الواجهة

## أمثلة على الاستخدام - Usage Examples

### تغيير الشاشة الحالية

```dart
_changeScreen(const DashboardScreen(), AppStrings.dashboard);
```

### إضافة عنصر قائمة جديد

```dart
final menuItems = MenuProvider.of(context).menuItems;
menuItems.add(
  MenuItem(
    label: 'عنصر جديد',
    icon: Icons.star,
  ),
);
```

### تحديث بيانات الإحصائيات

```dart
final stats = DashboardProvider.of(context).stats;
// تحديث قيمة الإحصائية الأولى
stats[0] = StatItem(
  label: stats[0].label,
  value: 150, // القيمة الجديدة
  icon: stats[0].icon,
  color: stats[0].color,
);
```

## ملاحظات تطويرية - Development Notes

- جميع الدوال تستخدم نمط البناء الموحد لـ Flutter
- تم استخدام Provider لإدارة الحالة بطريقة فعالة
- تم تنظيم الشفرة بطريقة مُحكمة لسهولة الصيانة والتطوير
- تم توثيق جميع الدوال باستخدام تعليقات Dart Doc 