'use strict';

var path = require('path');
var webpack = require('webpack');

var NODE_ENV = process.env.NODE_ENV;

var env = {
  production: NODE_ENV === 'production',
  staging: NODE_ENV === 'staging',
  test: NODE_ENV === 'test',
  development: NODE_ENV === 'development' || typeof NODE_ENV === 'undefined'
};

Object.assign(env, {
  build: env.production || env.staging
});

module.exports = {
  target: 'web',

  entry: ['src/index.js'],

  output: {
    path: path.resolve(__dirname, "src/dist"),
    publicPath: '/dist/',
    filename: 'bundle.js',
  },

  resolve: {
    root: path.join(__dirname, ''),
    modulesDirectories: ['web_modules', 'node_modules', 'client', 'js'],
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx']
  },

  plugins: [new webpack.DefinePlugin({
    __DEV__: env.development,
    __STAGING__: env.staging,
    __PRODUCTION__: env.production,
    __CURRENT_ENV__: '\'' + NODE_ENV + '\''
  })],

  module: {
    loaders: [
      { 
        test: /\.scss$/, 
        loader: 'style!css!autoprefixer?browsers=last 2 version!sass?outputStyle=expanded' 
      },
      { 
        exclude: /(node_modules|bower_components)/,
        text: /\.js$/, 
        loader: 'babel-loader',
      },
      { test: /\.jsx?$/, 
        loaders: ['babel'], 
        exclude: /node_modules/ 
      }
    ],

    noParse: /\.min\.js/
  }
};