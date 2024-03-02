String formatDecimalValue(String value) {
  try {
    if (value.contains('.')) {
      // Ensure a maximum of 2 decimal places
      value = value.substring(0, value.indexOf('.') + 3);
    } else {
      // Add ".00" if no decimal is present
      value += ".00";
    }
    return value;
  } catch (e) {
    return 0.00.toString();
  }
}
