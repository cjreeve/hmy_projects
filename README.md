# Project Management App

This is a modern Ruby on Rails project management tool. It allows users to:

- Create, view, edit, and delete projects
- Track project state transitions (draft → proceeding → done)
- Add and view comments on projects
- View a detailed project log of state and attribute changes
- Enjoy a clean, responsive UI styled with Tailwind CSS
- Experience robust, modern Rails 7+ Turbo compatibility (no Rails UJS required)

## Features
- **Project workflow:** Draft → Proceeding → Done, with state machine logic
- **Activity log:** All state and attribute changes are logged and visible per project
- **Comments:** Add and view comments on each project
- **Turbo-native destroy:** Uses `data-turbo-method` and `data-turbo-confirm` for safe deletes
- **Comprehensive test suite:** RSpec for models/controllers, Cucumber for end-to-end features

## Getting Started

### Prerequisites
- Ruby 3.1+
- Rails 7+
- Node.js & Yarn (for JS dependencies, if needed)
- SQLite (default) or your preferred DB

### Setup
1. **Install dependencies:**
   ```bash
   bundle install
   # If using JS bundling: yarn install
   ```
2. **Set up the database:**
   ```bash
   rails db:setup
   # or, if already set up:
   rails db:migrate
   ```
3. **(Optional) Seed data:**
   ```bash
   rails db:seed
   ```

### Running the App
Start the Rails server:
```bash
bin/rails server
```
Visit [http://localhost:3000](http://localhost:3000) in your browser.

### Running the Tests
#### RSpec (unit & model tests):
```bash
bundle exec rspec
```

#### Cucumber (feature/integration tests):
```bash
bundle exec cucumber
```
- The destroy feature requires a JS-capable driver (Selenium/Chrome is default).
- No Rails UJS is required; destroy links use Turbo-native attributes.

### Running the Linter (RuboCop)
To check code style and linting (as in CI):
```bash
bin/rubocop -f github
```

## Notes
- **Destroy links:** Use `data-turbo-method="delete"` and `data-turbo-confirm` for modern Rails compatibility. No need for `method: :delete` or Rails UJS.
- **Turbo:** The app is fully compatible with Turbo/Hotwire. No legacy JS required.
- **Tests:** All features are covered by Cucumber and RSpec. The destroy flow is tested with Capybara's `accept_confirm`.

## Contributing
This was just a test app and no changes will be accepted. Please feel free to clone the app and do with it as you wish.