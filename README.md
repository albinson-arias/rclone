# BPlace

A Flutter application with Serverpod backend, replicating a public pixel board
experience similar to Reddit's r/place. This project allows users to
collaboratively draw on a shared canvas by placing pixels in real-time.

**Hosted App:** [https://bplace.app](https://bplace.app)

## Features

- **Real-time Pixel Placement:** Users can place pixels on a shared canvas, and
  changes are updated in real-time for all users.
- **User Authentication:** Login screen allows users to enter a username to join
  the board.
- **Color Picker:** Choose from a variety of colors to place on the board.
- **Collaborative Drawing:** Multiple users can draw on the board
  simultaneously, with pixel changes reflecting immediately.

## Getting Started

### Prerequisites

- **Flutter SDK** (version X.X.X or later)
- **Serverpod** backend setup

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/pixel-board-app.git
   cd pixel-board-app
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the Serverpod Backend:**
   - Set up and run the Serverpod backend according to the Serverpod
     [documentation](https://serverpod.dev/docs).
   - Make sure to configure the backend server's URL in the Flutter app for it
     to connect correctly.

4. **Run the Flutter App:**
   ```bash
   flutter run
   ```

## Configuration

- **Backend URL:** Update the backend URL in the `lib/config.dart` file to point
  to your Serverpod backend instance.

## Contributing

We welcome contributions! If you'd like to improve the app or add new features,
please feel free to submit a pull request.

### Issues

Feel free to submit issues and enhancement requests.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE)
file for details.

## Acknowledgments

- Thanks to [Serverpod](https://serverpod.dev/) for providing a seamless backend
  framework for Flutter applications.
- Inspired by Reddit's r/place.
