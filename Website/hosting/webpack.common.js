'use strict';

var path = require('path');
var webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
  target: 'web',

  entry: [
    path.join(__dirname, 'src/index.js')
  ],

  output: {
    filename: '[name].bundle.js',
  },

  plugins: [
    new webpack.NamedModulesPlugin(),
    new HtmlWebpackPlugin({
      filename: 'index.html',
      template: path.join(__dirname, 'index_template.html')
    }),
    new BundleAnalyzerPlugin()
  ],

  optimization: {
    splitChunks: {
        cacheGroups: {
            commons: {
                test: /[\\/]node_modules[\\/]/,
                name: "vendors",
                chunks: "all"
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
      },
      {
        test: /\.md$/,
        use: [

            {
                loader: "html-loader"
            },
            {
                loader: "markdown-loader"
            }
        ]
      }
    ],

  }
};
