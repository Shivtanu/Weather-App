a simple weather app using Flutter that displays current weather information for a given city.
Features:
  1. Use the OpenWeatherMap API (or any other free weather API) to fetch weather data.
  2. The app should have two screens: a. Home screen with a search bar to enter a city name b. Weather details screen to display the weather information
  3. On the home screen:
    ○ Implement a search bar where users can enter a city name
    ○ Add a button to trigger the weather search
    ○ Display a loading indicator while fetching data
  4. On the weather details screen, display the following information:
    ○ City name, Current temperature (in Celsius), Weather condition (e.g., cloudy, sunny, rainy), An icon representing the weather condition, Humidity percentage, Wind speed.
  5. Implement proper error handling for API requests and display user-friendly error messages.
  6. Use appropriate state management (e.g., setState, Provider) to manage the app's state.
  7. Implement a basic responsive design that works on both mobile and tablet devices.
  8. Add a "Refresh" button on the weather details screen to fetch updated weather data.
  9. Implement data persistence to save the last searched city
