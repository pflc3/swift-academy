# Swift Academy 📱

## 🌟 Overview
Swift Academy is an interactive learning app that makes CS and iOS fundamentals fun and approachable for students new to tech. It blends structured lessons, a friendly AI coach, and a gamified profile to keep learners engaged.

## 🎯 Mission: Empowering the next generation of coders

Bridge the gap between traditional education and modern tech skills, making programming accessible to underrepresented students in technology.

## 🤖 Key Features
- **Learning Path**: tiered lessons with progress tracking
- **Lesson UX**: videos, slides, goals, comprehension checks, resources
- **AI Coach**: chat-based help for coding questions
- **Profiles**: editable bio, stats, achievements
- **Auth & Nav**: sign up / sign in, session persistence, custom side menu
- **Toasts**: unified, polished in-app notifications

## 🏗️ Technical Architecture
### **Built With**
- **IDE**: Xcode 14.0+
- **Language**: Swift 5.0+
- **Framework**: SwiftUI
- **Database**: Firebase (Auth + Firestore)
- **Linting**: SwiftLint
- **Architecture**: MVVM (Model-View-ViewModel)
- **Services**: SessionManager, UserService (Firebase), ChatService (HTTP), ToastCenter

### **Project Structure**
```
SwiftAcademy/
├── App/
│   ├── AppDelegate.swift
│   ├── AppDependencies.swift
│   ├── GoogleService-Info.plist
│   ├── Launch Screen.storyboard
│   ├── SplashView.swift
│   └── SwiftAcademyApp.swift
├── Core/
│   ├── AppMode.swift
│   ├── ColorHex.swift
│   ├── PreviewSupport.swift
│   └── Theme.swift
├── Models/
│   ├── Achievement.swift
│   ├── Chat/
│   │   ├── ChatDomain.swift
│   │   ├── ChatMessage.swift
│   │   └── ChatViewID.swift
│   ├── DTOs/
│   │   └── ChatDTOs.swift
│   ├── Lesson.swift
│   └── UserProfile.swift
├── Resources/
│   ├── LessonData.swift
│   └── MockData.swift
├── Services/
│   ├── ChatService.swift
│   ├── SessionManager.swift
│   ├── ToastCenter.swift
│   └── UserService.swift
├── SwiftAcademy.entitlements
└── Views/
    ├── Auth/
    │   ├── AuthView.swift
    │   ├── AuthViewModel.swift
    │   ├── Components/
    │   └── Sections/
    ├── Chat/
    │   ├── ChatBotView.swift
    │   ├── ChatViewModel.swift
    │   ├── Components/
    │   └── Sections/
    ├── Home/
    │   ├── HomeView.swift
    │   ├── HomeViewModel.swift
    │   ├── Components/
    │   └── Sections/
    ├── Lessons/
    │   ├── LessonDetailView.swift
    │   ├── LessonDetailViewModel.swift
    │   ├── Components/
    │   └── Sections/
    ├── Navigation/
    │   ├── Components/
    │   └── ContentView.swift
    └── Profile/
        ├── ProfileView.swift
        ├── ProfileViewModel.swift
        └── Sections/
```

## 🗄️ Data & Backend

### **Firebase (Auth + Firestore)**
- Initialization: `FirebaseApp.configure()` in `AppDelegate`
- Collections `users/{uid}` document shape:
  ```json
  {
    "email": "student@example.com",
    "name": "Student Name",
    "bio": "Swift Academy Student",
    "lessonsCompleted": 0,
    "achievements": [
      { "name": "First Steps", "description": "...", "icon": "star", "unlocked": false }
    ]
  }
  ```

### **Chat API**
- Endpoint: `POST /chat` with message turns
- If the server is down/offline, the app shows a friendly inline message in chat.

### **Previews & Mocks**
- Previews inject dependencies via a small helper (e.g. `previewEnv`) and do not hit Firebase or the API.
- View models check if app is in "use mocks" mode and short-circuits network calls with mock responses.

## 🧹 Linting (SwiftLint)
- **Why**: consistent style, cleaner diffs, early feedback
- **How**: SwiftLintPlugins via Xcode
- **Config**: `.swiftlint.yml` in repo root enabled extra rules
- **Usage**:
  - In Xcode: Lint runs automatically on build (clickable warnings) 
  - Optional CLI (auto-fix): `brew install swiftlint` then `swiftlint --fix && swiftlint`

## 🎓 Origin
Inspired by the **Gcode Summer Program** from **Prime Factors Learning Lab**, bringing CS education to underrepresented students.

## 📞 Connect With Us

- **Project Lead**: Estuardo Lopez - estulpzlet@gmail.com
- **Organization**: Prime Factors Learning Lab
- **Website**: [Prime Factors Learning Lab](https://primefactors.org/programs/gcode)
- **Email**: team@primefactors.org

## 🙏 Acknowledgments

- **Prime Factors Learning Lab** for the inspiring Gcode program
- **Our amazing student engineers**
- **The Swift community** for continuous support and learning resources

Made with ❤️ by the Swift Minds team
