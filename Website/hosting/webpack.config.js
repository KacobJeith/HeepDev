'use strict';

var path = require('path');
var webpack = require('webpack');

module.exports = {
  target: 'web',

  entry: ['src/index.js'],

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: 'bundle.js',
  },

  plugins: [
    // OccurenceOrderPlugin is needed for webpack 1.x only
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.HotModuleReplacementPlugin(),
  ],

  devServer: {
    contentBase: path.join(__dirname),
    compress: true,
    port: 9000,
    historyApiFallback: true
  },

  resolve: {
    root: path.join(__dirname, ''),
    modulesDirectories: ['web_modules', 'node_modules', 'client', 'js'],
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx']
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
       test: /\.(jpe?g|png|gif|svg)$/i,
       loaders: [
         'file?hash=sha512&digest=hex&name=[hash].[ext]',
         'image-webpack?bypassOnDebug&optimizationLevel=7&interlaced=false'
       ]
      },
      {
      test: /\.(mov|mp4)$/,
      loader: 'file-loader',
      options: {
        name: '[name].[ext]'} 
      }
    ],

  }
};