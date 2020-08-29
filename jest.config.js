module.exports = {
  clearMocks: true,
  testEnvironment: "jsdom",
  moduleDirectories: [
   "node_modules",
   "app/javascript"
 ],
  moduleFileExtensions: [
    "js",
    "json",
    "vue"
  ],
  roots: [
    "app/javascript"
  ],
  transform: {
    "^.+\\.js$": "babel-jest",
    ".*\\.(vue)$": "vue-jest"
  },
};
