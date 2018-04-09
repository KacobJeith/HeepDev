'use strict';
const merge = require('webpack-merge');
var webpack = require('webpack');
const common = require('./webpack.common.js');

module.exports = merge(common, {

  mode: 'development',

  devServer: {
    port: 9001,
    historyApiFallback: true
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]
});
