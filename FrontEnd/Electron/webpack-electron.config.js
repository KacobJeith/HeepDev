'use strict';

var path = require('path');
var webpack = require('webpack');

module.exports = {
  target: 'electron-main',

  entry: ['src/electron_main.js'],

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: 'electron_bundle.js',
  },

  plugins: [
    // OccurenceOrderPlugin is needed for webpack 1.x only
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.HotModuleReplacementPlugin(),
  ],

  devServer: {
    publicPath: '/dist',
    port: 9000,
    historyApiFallback: true
  },

  resolve: {
    root: path.join(__dirname, ''),
    modulesDirectories: ['web_modules', 'node_modules', 'client', 'js'],
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx']
  },

  node: {
    __dirname: false
  },

  module: {
    loaders: [
      { 
        exclude: /(node_modules|bower_components)/,
        text: /\.js$/, 
        loader: 'babel-loader',
      },
      { test: /\.jsx?$/, 
        loaders: ['babel'], 
        exclude: /node_modules/ 
      },
      {
      test: /\.(jpe?g|png|gif|svg|mov|mp4)$/,
      loader: 'file-loader',
      options: {
        name: '[name].[ext]'} 
      },
      {
        test: /\.json$/,
        loader: 'json-loader'
      }
    ],

  }
};