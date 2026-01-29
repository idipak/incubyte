# Article App

## Project Overview

This is an Article App built with Flutter using **Clean Architecture**. It fetches articles from a remote API and displays them in a modern, dark-themed UI.

**Main Technologies:**
*   **Framework:** Flutter
*   **State Management:** flutter_bloc
*   **Networking:** dio
*   **Dependency Injection:** get_it
*   **Architecture:** Clean Architecture (Presentation, Domain, Data)

## Architecture

The project is structured into three main layers:

1.  **Presentation Layer (`lib/features/articles/presentation`)**:
    *   **Pages:** `ArticlePage` - The main screen displaying the list of articles.
    *   **Widgets:** `ArticleCard` - Reusable widget for individual article items.
    *   **Bloc:** `ArticleBloc` - Manages the state (Loading, Loaded, Error) of the article list.

2.  **Domain Layer (`lib/features/articles/domain`)**:
    *   **Entities:** `Article` - Pure Dart class representing an article.
    *   **Repositories:** `ArticleRepository` - Abstract interface defining the contract for data operations.
    *   **Use Cases:** `GetArticles` - Encapsulates the business logic for fetching articles.

3.  **Data Layer (`lib/features/articles/data`)**:
    *   **Models:** `ArticleModel` - Data transfer object with JSON serialization logic.
    *   **Data Sources:** `ArticleRemoteDataSource` - Handles API calls using Dio.
    *   **Repositories:** `ArticleRepositoryImpl` - Implements the domain repository and coordinates data sources.

## Building and Running

### Prerequisites
Ensure you have the Flutter SDK installed.

### Run App
```bash
flutter run
```

### Dependencies
*   `flutter_bloc`
*   `dio`
*   `equatable`
*   `get_it`
*   `google_fonts`