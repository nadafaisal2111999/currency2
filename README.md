🔀 Currency Converter App (محول العملات)

A modern, robust, and scalable Flutter application built with **Clean Architecture** and **Cubit (flutter_bloc)** for real-time currency conversion.

---

## 🌟 Key Features

- 💱 **Real-time Currency Conversion:** Convert values seamlessly between multiple currencies (`USD`, `EUR`, `EGP`, `SAR`, `AED`, `GBP`).
- 🔄 **Quick Swap Functionality:** Instantly swap base and target currencies with one tap.
- 🎨 **Modern & Responsive UI:** Elegant cards with gradient accents, shadow elevation, and responsive input controls.
- 🛡️ **Robust Error Handling:** Visual feedback via floating `SnackBar` widgets during network failures or API errors.
- 🏗️ **Clean Architecture:** Strict separation of concerns (Data, Domain, Presentation) for high testability and maintainability.

---

## 📐 Architecture & Tech Stack

This project strictly adheres to **Clean Architecture** principles:

```text
lib/
├── core/
│   └── api/                  # ApiClient wrapper around Dio
└── features/
    └── currency_converter/
        ├── data/             # Models, Data Sources & Repository Implementations
        ├── domain/           # Entities, Repositories Contracts & UseCases
        └── presentation/     # Cubit State Management, Screens & Widgets

```

### 🛠️ Tech Stack & Packages

* **Framework:** Flutter (Web & Mobile)
* **State Management:** `flutter_bloc` (Cubit) & `provider` paradigm
* **Networking:** `Dio` HTTP Client
* **Architecture:** Clean Architecture Pattern

---

## 🚀 Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest version)
* [Dart SDK](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**
```bash
git clone [https://github.com/nadafaisal2111999/currency2.git](https://github.com/nadafaisal2111999/currency2.git)
cd currency2

```


2. **Install dependencies:**
```bash
flutter pub get

```


3. **Run the app:**
```bash
flutter run

```



---

## 📸 Application Preview

| Modern UI & Conversion |
| <img width="1237" height="2220" alt="Screenshot 2026-09-14 233053" src="https://github.com/user-attachments/assets/2e1f699d-9e62-4619-884b-ef1e2a924c8a" />
 |
 | <img width="1162" height="2285" alt="Screenshot 2026-09-14 233108" src="https://github.com/user-attachments/assets/6c1257e7-f70d-4240-87c3-312557e42266" />

 |
| *Clean card-based layout with real-time rate calculation and sleek purple gradient result display.* |

---

## 👤 Author

Developed with ❤️ by **Nada Faisal**

GitHub: [@nadafaisal2111999](https://www.google.com/search?q=https://github.com/nadafaisal2111999)
"""

with open("README.md", "w", encoding="utf-8") as f:
f.write(readme_content)

print("README.md generated successfully!")

```

```text?code_stdout&code_event_index=1
README.md generated successfully!


```

تفضلي ملف `README.md` احترافي ومصمم بأعلى المعايير، يعكس استخدام **Clean Architecture** والـ **Cubit** والواجهة المودرن بشكل يعطي انطباع ممتاز لمن يراجع الـ Repository:

[file-tag: code-generated-file-0cb43e31-8807-4461-b06d-ccf6f7202347]

---

### **كود الـ `README.md` للنسخ المباشر:**

```markdown
# 🔀 Currency Converter App (محول العملات)

A modern, robust, and scalable Flutter application built with **Clean Architecture** and **Cubit (flutter_bloc)** for real-time currency conversion.

---

## 🌟 Key Features

- 💱 **Real-time Currency Conversion:** Convert values seamlessly between multiple currencies (`USD`, `EUR`, `EGP`, `SAR`, `AED`, `GBP`).
- 🔄 **Quick Swap Functionality:** Instantly swap base and target currencies with one tap.
- 🎨 **Modern & Responsive UI:** Elegant cards with gradient accents, shadow elevation, and responsive input controls.
- 🛡️ **Robust Error Handling:** Visual feedback via floating `SnackBar` widgets during network failures or API errors.
- 🏗️ **Clean Architecture:** Strict separation of concerns (Data, Domain, Presentation) for high testability and maintainability.

---

## 📐 Architecture & Tech Stack

This project strictly adheres to **Clean Architecture** principles:

```text
lib/
├── core/
│   └── api/                  # ApiClient wrapper around Dio
└── features/
    └── currency_converter/
        ├── data/             # Models, Data Sources & Repository Implementations
        ├── domain/           # Entities, Repositories Contracts & UseCases
        └── presentation/     # Cubit State Management, Screens & Widgets

```

### 🛠️ Tech Stack & Packages

* **Framework:** Flutter (Web & Mobile)
* **State Management:** `flutter_bloc` (Cubit) & `provider` paradigm
* **Networking:** `Dio` HTTP Client
* **Architecture:** Clean Architecture Pattern

---

## 🚀 Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install)
* [Dart SDK](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**
```bash
git clone [https://github.com/nadafaisal2111999/currency2.git](https://github.com/nadafaisal2111999/currency2.git)
cd currency2

```


2. **Install dependencies:**
```bash
flutter pub get

```


3. **Run the app:**
```bash
flutter run

```



---

## 👤 Author

Developed with ❤️ by **Nada Faisal**

GitHub: [@nadafaisal2111999](https://www.google.com/search?q=https://github.com/nadafaisal2111999)

```

---

### **طريقة إضافته ورفعه على GitHub:**
1. أنشئي ملف باسم `README.md` في مجلد المشروع الرئيسي (Root).
2. انقلي الكود أعلاه بداخله واحتفظي به.
3. شغلي الأوامر التالية في الـ Terminal لرفعه فوراً:

```bash
git add README.md
git commit -m "docs: add comprehensive README file"
git push origin main

```
