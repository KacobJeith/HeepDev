'use strict';

var path = require('path');
var webpack = require('webpack');

module.exports = {

  context: path.resolve(__dirname),
  
  entry: './src/electron_main.js',

  target: 'electron-main',

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: 'electron_bundle.js',
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
  ],

  devServer: {
    publicPath: '/dist',
    port: 9000,
    historyApiFallback: true
  },

  resolve: {
    modules: ['node_modules'],
    extensions: ['.js']
  },

  node: {
    __dirname: false
  },

  module: {
    rules: [
      { 
        test: /\.js$/, 
        use: 'babel-loader',
        exclude: /(node_modules)/
      },
      {
        test: /\.(jpe?g|png|gif|svg|mov|mp4)$/,
        use: 'file-loader'
      }
    ],

  }
};