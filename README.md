**🍽️ Recipe Finder App**
A feature-rich Flutter mobile application for discovering, saving, and exploring delicious recipes across different meal categories. Perfect for food enthusiasts looking for culinary inspiration!
**✨ Features**

**🔍 Smart Recipe Discovery**
Category-based Browsing: Browse recipes by Breakfast, Lunch, and Dinner categories
Advanced Search: Multi-ingredient search with comma-separated queries
Featured Recipes: Highlighted recipes on the home page
Tags & Filters: Filter recipes by dietary preferences and cooking time

**❤️ Personalized Experience**
Favorite System: Heart animation with visual feedback when saving recipes
User Authentication: Secure login/signup with Firebase Authentication
Profile Management: User account creation and password reset functionality
Dark Mode: Toggle between light and dark themes

**🎨 Engaging UI/UX**
Smooth Animations: Tap animations, scale effects, and interactive feedback
Visual Recipe Cards: Attractive cards with cooking time indicators
Detailed Recipe Pages: Step-by-step instructions with numbered procedures
Popup Notifications: Visual confirmation for favorite actions

**🔧 Utility Features**
Help & FAQ: Comprehensive help section with common questions
About Page: Team information and app description
Settings: Theme customization options
Navigation Drawer: Easy access to all app sections

**🏗️ Architecture**
lib/
├── models/
│   └── recipe.dart          # Recipe data model
├── services/
│   ├── recipe_service.dart  # Recipe data management
│   ├── favorites_service.dart # Local favorites storage
│   └── auth_service.dart    # Firebase authentication
├── widgets/
│   └── app_drawer.dart      # Navigation drawer component
├── pages/
│   ├── home_page.dart       # Main landing page
│   ├── breakfast_page.dart  # Breakfast recipes
│   ├── lunch_page.dart      # Lunch recipes
│   ├── dinner_page.dart     # Dinner recipes
│   ├── recipe_details_page.dart # Detailed recipe view
│   ├── favorites_page.dart  # Saved favorites
│   ├── profile_page.dart    # User authentication/profile
│   ├── settings_page.dart   # App settings
│   ├── help_page.dart       # Help & FAQ
│   └── about_page.dart      # About information
└── main.dart               # App entry point

**🔐 Authentication**
The app uses Firebase Authentication for:
Email/Password signup and login
Password reset functionality
Persistent login sessions
Secure user data management

**🎯 Key Implementation Details**
1. State Management
Uses Flutter's built-in setState for local state
Future-based data loading with loading states
Animation controllers for interactive elements
2. Search Functionality
Multi-ingredient search with partial matching
Real-time suggestions as you type
Category-specific search delegates
3. Animations
Scale animations on card taps
Heart animation for favorites
Focus animations on search bars
Smooth page transitions
4. Responsive Design
Adaptive layouts for different screen sizes
Scrollable content for long recipes
Proper padding and spacing
📝 Code Quality
Clean, commented code with clear structure
Separation of concerns (UI, business logic, data)
Error handling with try-catch blocks
Loading states for async operations
Proper widget lifecycle management

**👥 Team**
This project was developed by:
Aliha (FA23-BSE-092) - 
Ariba (FA23-BSE-138) -
Fakiha (FA23-BSE-137) - 
Laiba (FA23-BSE-142) - 


**🔮 Future Enhancements**
Recipe sharing functionality
Nutritional information
Video tutorials
User recipe submission
Social features (follow, like, comment)
Meal planning calendar

