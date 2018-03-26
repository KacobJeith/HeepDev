'use strict';

var path = require('path');
var webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');


module.exports = {
  target: 'web',

  entry: {
    index: './src/index.js'
  },

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: '[name].bundle.js',
  },

  plugins: [
    new HtmlWebpackPlugin({
      title: 'Hot Module Replacement',
      filename: 'index.html',
      template: 'index.template.ejs',
      inject: 'body'
    }),
    new webpack.HotModuleReplacementPlugin()
  ],

  devServer: { 
    publicPath: './dist',
    // contentBase: './dist',
    // compress: true,
    port: 9000,
    // open: true,
    hot: true,
    watchContentBase: true,
    // inline: true,
    historyApiFallback: true,
    // stats: {
    //   colors: true,
    //   hash: false,
    //   version: false,
    //   timings: false,
    //   assets: false,
    //   chunks: false,
    //   modules: false,
    //   reasons: false,
    //   children: false,
    //   source: false,
    //   errors: true,
    //   errorDetails: true,
    //   warnings: true,
    //   publicPath: false
    // }
  },

  optimization: {
        splitChunks: {
            cacheGroups: {
                index: {
                    name: "index",
                    chunks: "async",
                },
                commons: {
                    test: /[\\/]node_modules[\\/]/,
                    name: 'vendor',
                    chunks: 'all'
                }
            }
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
          loader: 'babel-loader',
          options: {
            cacheDirectory: true,
            plugins: ['react-hot-loader/babel']
          }
        },
      },
      {
        test: /\.(jpe?g|png|gif|svg|mov|mp4)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]'
        } 
      },
      {
        test: /\.html$/,
        use: [ {
          loader: 'html-loader',
          options: {
            minimize: true
          }
        }]
      }
    ],

  }
};