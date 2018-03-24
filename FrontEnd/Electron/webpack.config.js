'use strict';

var path = require('path');
var webpack = require('webpack');

module.exports = {
  target: 'web',

  entry: './src/index.js',

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: 'bundle.js',
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
  ],

  devServer: { 
    port: 9000,
    historyApiFallback: true,
    stats: {
      colors: true,
      hash: false,
      version: false,
      timings: false,
      assets: false,
      chunks: false,
      modules: false,
      reasons: false,
      children: false,
      source: false,
      errors: true,
      errorDetails: true,
      warnings: true,
      publicPath: false
    }
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