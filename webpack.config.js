const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  entry: "./src/index.tsx",
  devtool: "inline-source-map",
  mode: "development",
  module: {
    rules: [
      {
        test: /\.ts(x?)$/,
        use: "ts-loader",
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js"],
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "Application Title",
      hash: false,
      filename: "./index.html",
      template: "./index.html",
      inject: true,
    }),
  ],
  output: {
    filename: "bundle.js",
    path: path.resolve(__dirname, "public"),
  },
};
