import React from 'react';
import { Button, StyleSheet, Text, View } from 'react-native';
import { requestReview } from 'react-native-store-review';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
});

const App = () => (
  <View style={styles.container}>
    <Text style={styles.welcome}>Welcome to React Native!</Text>
    <Button onPress={() => requestReview()} title="Request Review" />
  </View>
);

export default App;
