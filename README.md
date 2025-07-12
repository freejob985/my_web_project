# لوحة تحكم  - Dashboard Project

## نظرة عامة - Overview

لوحة تحكم عربية متكاملة مبنية باستخدام Flutter Web، مع دعم كامل للغة العربية والاتجاه من اليمين إلى اليسار (RTL). تتضمن اللوحة إحصائيات ورسوم بيانية للعقارات والمكاتب العقارية والمستخدمين.

A comprehensive Arabic dashboard built with Flutter Web, with full support for Arabic language and right-to-left (RTL) direction. The dashboard includes statistics and charts for properties, real estate offices, and users.

## المميزات - Features

- واجهة عربية كاملة بتصميم RTL
- شريط جانبي ثابت مع قوائم رئيسية وفرعية
- شريط علوي يعرض عنوان الصفحة الحالية
- بطاقات إحصائية تفاعلية
- رسوم بيانية للعقارات حسب المنطقة
- رسوم بيانية دائرية لأنواع العقارات
- تصميم متجاوب يعمل على جميع أحجام الشاشات
- دعم للخط العربي Cairo

## متطلبات النظام - System Requirements

- Flutter SDK 3.7.0 أو أحدث
- Dart SDK 3.0.0 أو أحدث
- متصفح حديث لتشغيل تطبيق الويب

## التثبيت - Installation

1. تأكد من تثبيت Flutter SDK:
   ```
   flutter --version
   ```

2. استنساخ المشروع:
   ```
   git clone <repository-url>
   cd my_web_project
   ```

3. تثبيت الاعتماديات:
   ```
   flutter pub get
   ```

4. تشغيل التطبيق في وضع التطوير:
   ```
   flutter run -d chrome
   ```

5. بناء إصدار للإنتاج:
   ```
   flutter build web
   ```

## هيكل المشروع - Project Structure

```
lib/
  ├── constants/          # ثوابت التطبيق (الألوان، النصوص، السمات)
  ├── models/             # نماذج البيانات
  ├── providers/          # مزودي الحالة (State Providers)
  ├── screens/            # شاشات التطبيق
  ├── widgets/            # مكونات واجهة المستخدم القابلة لإعادة الاستخدام
  └── main.dart           # نقطة دخول التطبيق
```

## استخدام المكونات - Component Usage

### القائمة الجانبية - Sidebar

```dart
Sidebar(width: 250)
```

### شريط علوي - Top Bar

```dart
TopBar(title: 'لوحة التحكم')
```

### بطاقة إحصائية - Stat Card

```dart
StatCard(
  stat: StatItem(
    label: 'العقارات',
    value: 3720,
    icon: Icons.home,
    color: AppColors.propertiesCard,
  ),
)
```

### رسم بياني للمناطق - Region Chart

```dart
RegionChart(regions: dashboardProvider.regions)
```

### رسم بياني لأنواع العقارات - Property Type Chart

```dart
PropertyTypeChart(propertyTypes: dashboardProvider.propertyTypes)
```

## تدفق البيانات - Data Flow

1. يتم تعريف نماذج البيانات في مجلد `models/`
2. يتم إدارة حالة التطبيق باستخدام Provider في مجلد `providers/`
3. تقوم الواجهات بقراءة البيانات من Providers وعرضها
4. يتم تحديث الواجهة تلقائيًا عند تغيير البيانات باستخدام `notifyListeners()`

## سجل التعديلات - Modification Log

| الملف | الأسطر | التعديلات |
|------|-------|----------|
| pubspec.yaml | 30-60 | إضافة الاعتماديات اللازمة للمشروع |
| pubspec.yaml | 70-85 | إضافة تكوين الخطوط والأصول |
| lib/constants/* | جميع الأسطر | إنشاء ملفات الثوابت للألوان والنصوص والسمات |
| lib/models/* | جميع الأسطر | إنشاء نماذج البيانات للقائمة والإحصائيات والمناطق وأنواع العقارات |
| lib/providers/* | جميع الأسطر | إنشاء مزودي الحالة للقائمة ولوحة التحكم |
| lib/widgets/* | جميع الأسطر | إنشاء المكونات القابلة لإعادة الاستخدام |
| lib/screens/* | جميع الأسطر | إنشاء شاشات التطبيق |
| lib/main.dart | جميع الأسطر | تحديث نقطة الدخول لاستخدام التخطيط الرئيسي |

## نقاط قابلة للتحسين - Future Improvements

1. إضافة مصادقة المستخدمين (تسجيل الدخول/الخروج)
2. تنفيذ وظائف البحث في لوحة التحكم
3. إضافة إدارة كاملة للعقارات والمكاتب
4. تحسين الأداء للأجهزة المحمولة
5. إضافة وضع مظلم (Dark Mode)
6. تنفيذ تخزين البيانات المحلي أو الاتصال بواجهة برمجة تطبيقات خلفية
7. إضافة تصفية وفرز للبيانات
8. إضافة تصدير البيانات إلى Excel/PDF
9. تحسين اختبارات الوحدة والتكامل

## مخطط تدفق البيانات - Data Flow Diagram

```
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│             │      │             │      │             │
│   Models    │─────▶│  Providers  │─────▶│   Widgets   │
│             │      │             │      │             │
└─────────────┘      └─────────────┘      └─────────────┘
                           │                     │
                           │                     │
                           ▼                     ▼
                     ┌─────────────┐      ┌─────────────┐
                     │             │      │             │
                     │   Screens   │◀─────│    User     │
                     │             │      │ Interaction │
                     └─────────────┘      └─────────────┘
```

## المساهمة - Contributing

نرحب بالمساهمات! يرجى اتباع هذه الخطوات:

1. انشئ فرعًا (Fork) من المشروع
2. أنشئ فرعًا للميزة (`git checkout -b feature/amazing-feature`)
3. قم بعمل الالتزامات (`git commit -m 'Add some amazing feature'`)
4. ادفع إلى الفرع (`git push origin feature/amazing-feature`)
5. افتح طلب سحب (Pull Request)

## الترخيص - License

هذا المشروع مرخص بموجب رخصة MIT - انظر ملف LICENSE للحصول على التفاصيل.
