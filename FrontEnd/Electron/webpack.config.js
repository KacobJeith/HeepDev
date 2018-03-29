'use strict';

var path = require('path');
var webpack = require('webpack');
const WebpackDevServer = require('webpack-dev-server');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  target: 'web',

  context: __dirname,

  entry: [
    './src/index.js',
    'webpack-dev-server/client/index.js?http://localhost:8080/'
  ],

  mode: 'development',

  output: {
    filename: 'dist/bundle.js',
  },

  plugins: [
    new webpack.NamedModulesPlugin(),
    new webpack.HotModuleReplacementPlugin(),
    new HtmlWebpackPlugin({
      filename: 'index.html',
      template: path.join(__dirname, 'index.html')
    })
  ],

  devServer: { 
  },

  resolve: {
    modules: ['node_modules'],
    extensions: ['.js']
  },

  module: {
    rules: [
      { 
        exclude: /(node_modules)/,
        test: /\.js$/, 
        use: {
          loader: 'babel-loader'
        },
      },
      {
        test: /\.(jpe?g|png|gif|svg|mov|mp4)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]'
        } 
      }
    ],

  }
};
