# 🛰️ SatiShop

A mobile satellite mock sales catalog app built with Flutter.

---

## 📱 About

SatiShop is a Flutter mobile application that serves as a product catalog for satellite hardware. Users can browse available satellites, and manage a shopping cart — all powered by JSON data through a custom API.

This project was developed as part of the Software Persona internship program.

---

## ✨ Features

- 🏠 **Home Screen** — Browse the full satellite catalog
- 🔍 **Detail Page** — View specs and pricing for each satellite
- 🛒 **Cart Page** — Add and manage selected items
- 📦 **Local Images** — No backend required, data served from a custom API, images are served locally

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **StatefulWidget / StatelessWidget** architecture
- **Android Studio** For mobile phone emulation

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed ([flutter.dev](https://flutter.dev))
- A connected device or emulator

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/satishop.git

# Navigate into the project
cd satishop

# Check for errors, just in case
flutter doctor

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📁 Project Structure

```

📦lib
 ┣ 📂components
 ┃ ┗ 📜product_card.dart
 ┣ 📂models
 ┃ ┗ 📜satellite_model.dart
 ┣ 📂services
 ┃ ┣ 📜api_service.dart
 ┃ ┗ 📜local_storage_service.dart
 ┣ 📂views
 ┃ ┣ 📜cart_screen.dart
 ┃ ┣ 📜home_screen.dart
 ┃ ┗ 📜product_detail_screen.dart
 ┗ 📜main.dart

```

---

## 📸 Screenshots

<img width="423" height="901" alt="image" src="https://github.com/user-attachments/assets/50d6c3c0-e63f-4eb7-bb7c-1a064b2e12e6" />

<img width="418" height="899" alt="image" src="https://github.com/user-attachments/assets/9cbf5d9d-72e5-40f7-803f-9aaf18d7a59f" />

<img width="421" height="905" alt="image" src="https://github.com/user-attachments/assets/ea56f9df-6fe9-4f2f-9776-4eb979e0f3c7" />


---


## 📄 License

This project is for educational purposes as part of an internship program.
