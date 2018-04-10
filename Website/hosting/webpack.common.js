'use strict';

var path = require('path');
var webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
var SWPrecacheWebpackPlugin = require('sw-precache-webpack-plugin');
var WebpackPwaManifest = require('webpack-pwa-manifest')

module.exports = {
  target: 'web',

  entry: [
    path.join(__dirname, 'src/index.js')
  ],

  output: {
    filename: 'bundle.js'
  },

  plugins: [
    new webpack.NamedModulesPlugin(),
    new HtmlWebpackPlugin({
      filename: 'index.html',
      template: path.join(__dirname, 'index_template.html')
    }),
    new SWPrecacheWebpackPlugin(),
    new WebpackPwaManifest({
        name: 'HeepWebsite',
        filename: "manifest.json",
        short_name: 'Heep',
        description: 'Main Heep Website & Webstore',
        background_color: '#ffffff',
        theme_color: '#ffffff',
        fingerprints: false,
        orientation: "landscape",
        icons: [
          {
            src: path.resolve('src/assets/Heep_Gradient.png'),
            sizes: [96, 128, 192, 256, 384, 512] 
          },
          {
            src: path.resolve('src/assets/Heep_Gradient.png'),
            size: '1024x1024' 
          }
        ]
    })
  ],

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
        use: {
          loader: 'file-loader',
          options: {
            name: '[name].[ext]'
          } 
        }
      }
    ],

  }
};
