const path = require('path');


const ExtractTextPlugin = require('extract-text-webpack-plugin');

const publicPath = 'http://localhost:3000/';

module.exports = {
  devtool: 'source-map',
  entry: [
    path.join(__dirname, 'web/static/index.js'),
    'webpack-dev-server/client?http://localhost:3000',
    'webpack/hot/only-dev-server',
  ],
  output: {
    path: path.join(__dirname, '/priv/static/js'),
    filename: 'index.bundle.js',
    publicPath,
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2016', 'react'],
          plugins: [['import', {libraryName: 'antd', style: true}]],
        },
      },
      {
        test: /\.(png|jpg|svg|gif)$/,
        loader: 'url-loader?limit=10000&name="[name]-[hash].[ext]"',
      },
      {
        test: /\.woff($|\?)|\.woff2($|\?)|\.ttf($|\?)|\.eot($|\?)|\.svg($|\?)/,
        loader: 'url-loader?limit=10000&name="[name]-[hash].[ext]"',
      },
      { test: /\.html$/, loader: 'url-loader!file-loader' },
      {
        test: /\.css$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: ['css-loader'],
        }),
      },
      {
        test: /\.less$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: ['css-loader', 'less-loader'],
        }),
      },
    ],
  },
  plugins: [
    new ExtractTextPlugin('css/app.css'),
  ],
  resolve: {
    extensions: ['.js', '.jsx'],
    alias: {
      phoenix: path.join(__dirname, '/deps/phoenix/priv/static/phoenix.js'),
    },
  },
  devServer: {
    hot: true,
    port: 3000,
    historyApiFallback: true,
  },
};
