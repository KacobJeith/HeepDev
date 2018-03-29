'use strict';
const merge = require('webpack-merge');
var webpack = require('webpack');
const common = require('./webpack.common.js');

module.exports = merge(common, {
  
  entry: [
    'webpack-dev-server/client/index.js?http://localhost:8080/'
  ],

  mode: 'development',

  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]
});
