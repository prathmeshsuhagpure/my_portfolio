#!/usr/bin/env bash
set -e

echo "📦 Installing Flutter..."

# Install Flutter into HOME directory
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable "$HOME/flutter"
fi

# Add Flutter to PATH
export PATH="$HOME/flutter/bin:$PATH"

echo "✅ Flutter version:"
flutter --version

echo "🌐 Enabling Flutter web..."
flutter config --enable-web

echo "📦 Fetching dependencies..."
flutter pub get

echo "🏗️ Building Flutter web app..."
flutter build web --release

echo "🎉 Flutter web build completed!"
