# QuickTask App

A feature-rich mobile task management application with integrated news feed, built with Flutter.

## 📱 About

QuickTask is a cross-platform mobile application that helps users manage their daily tasks efficiently while staying updated with the latest news. The app features a clean, intuitive interface with dark/light theme support and seamless navigation between tasks, news, and profile sections.

## 🛠️ Technology Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: Flutter Bloc / Provider / Riverpod
- **Local Storage**: Hive / Shared Preferences
- **API Integration**: News API (https://newsapi.org)
- **Notifications**: flutter_local_notifications
- **Architecture**: Clean Architecture with BLoC pattern

## 📋 Features

### Task Management
- ✅ Add, view, edit, and delete tasks
- ✅ Mark tasks as complete/incomplete
- ✅ Persistent local storage
- ✅ Task reminders with push notifications
- ✅ Task details and descriptions

### News Feed
- 📰 Latest news articles from News API
- 🔄 Pull-to-refresh functionality
- 🖼️ Article images and full details
- 🔗 Open articles in browser
- ⚡ Efficient caching

### User Interface
- 🎨 Beautiful, modern UI design
- 🌓 Dark/Light theme toggle
- 📱 Responsive layouts for all screen sizes
- 🔔 Loading states and error handling
- 📭 Empty state screens
- 🧩 Reusable component architecture

### Navigation
- 📑 Tab-based navigation (Tasks, News, Profile)
- 🔀 Hierarchical navigation for detail screens
- ↔️ Smooth screen transitions

## 📁 Project Structure

```
quicktask_app/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   ├── features/
│   │   ├── tasks/
│   │   │   ├── data/
│   │   │   │   ├── models/
│   │   │   │   └── repositories/
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   └── usecases/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   ├── news/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── profile/
│   │       └── presentation/
│   └── main.dart
├── assets/
│   └── images/
├── screenshots/
├── .env.example
├── pubspec.yaml
└── README.md
```

## 🚀 Installation and Setup

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode
- News API key (free tier from https://newsapi.org)

### Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd quicktask_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up API key**
   - Copy `.env.example` to `.env`
   ```bash
   cp .env.example .env
   ```
   - Open `.env` and add your News API key:
   ```
   NEWS_API_KEY=your_api_key_here
   ```

4. **Generate code (if using code generation)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   
   **For Android:**
   ```bash
   flutter run
   ```
   
   **For iOS:**
   ```bash
   flutter run
   # or open ios/Runner.xcworkspace in Xcode and run
   ```

## 🔑 API Setup Instructions

### Getting News API Key

1. Visit [https://newsapi.org](https://newsapi.org)
2. Click on "Get API Key" button
3. Sign up for a free account
4. Copy your API key from the dashboard
5. Paste it in the `.env` file as shown above

**Note**: The free tier allows 100 requests per day, which is sufficient for development and testing.

## 📱 Running the Project

### Android

1. Connect an Android device or start an emulator
2. Run:
   ```bash
   flutter run
   ```
3. The app will be installed and launched automatically

### iOS

1. Open iOS Simulator or connect an iOS device
2. Run:
   ```bash
   flutter run
   ```
3. For physical device, ensure proper code signing is configured in Xcode

### Build Release Version

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🧪 Testing

Run unit and widget tests:
```bash
flutter test
```

Run integration tests:
```bash
flutter test integration_test
```

## 📦 Dependencies

Main dependencies used in this project:

```yaml
dependencies:
  flutter_bloc: ^8.1.3          # State management
  hive: ^2.2.3                   # Local storage
  hive_flutter: ^1.1.0
  http: ^1.1.0                   # API calls
  flutter_local_notifications: ^16.1.0  # Notifications
  intl: ^0.18.1                  # Date formatting
  flutter_dotenv: ^5.1.0         # Environment variables
  cached_network_image: ^3.3.0   # Image caching
  url_launcher: ^6.2.1           # Open URLs
  equatable: ^2.0.5              # Value equality
```

## 🎨 Features Demonstration

### Task Management
- Create tasks with title, description, and due date
- Set reminders for important tasks
- Edit existing tasks inline
- Delete tasks with confirmation
- Mark tasks as complete with visual feedback
- Filter tasks by status (All/Active/Completed)

### News Integration
- Fetches latest headlines from News API
- Beautiful card layout with images
- Swipe down to refresh news
- Tap to read full article
- Handles network errors gracefully

### Theme Support
- Toggle between light and dark modes
- Persists user preference
- Smooth theme transitions
- Consistent color scheme across app

## 🐛 Troubleshooting

### Common Issues

**Issue**: API not working
- **Solution**: Check your `.env` file and ensure API key is correct

**Issue**: Notifications not appearing
- **Solution**: Grant notification permissions in device settings

**Issue**: Build fails
- **Solution**: Run `flutter clean` and `flutter pub get`

**Issue**: Hive errors
- **Solution**: Run `flutter pub run build_runner build --delete-conflicting-outputs`

## 📸 Screenshots

Screenshots are available in the `screenshots/` folder:
- `01_tasks_screen.png` - Task management interface
- `02_news_feed.png` - News feed with articles
- `03_profile_screen.png` - User profile and settings

## 👨‍💻 Developer Information

**Name**: [Your Full Name]  
**Email**: [your.email@example.com]  
**Phone**: [Your Phone Number]  
**GitHub**: [Your GitHub Profile]  
**LinkedIn**: [Your LinkedIn Profile]

## 📄 License

This project is created as part of a mobile app developer assignment.

## 🙏 Acknowledgments

- News API for providing the news data
- Flutter community for excellent packages
- Anthropic Claude for development assistance

---

**Note**: Make sure to keep your `.env` file secure and never commit it to version control. The `.env.example` file is provided as a template.