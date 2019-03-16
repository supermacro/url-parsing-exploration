const webpack = require('webpack')
const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

const SOURCE_DIR = path.join(__dirname, 'src')

const makeProdConfig = (common) => {
  common.module.rules.push(
    {
      test:    /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      loader:  'elm-webpack-loader',
    }
  )

  return common
}
  
const makeDevConfig = (common) => {
  common.plugins.push(
    // Suggested for hot-loading
    new webpack.NamedModulesPlugin()
  )

  common.module.rules.push(
    {
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: [
          { loader: "elm-hot-webpack-loader" },
          {
              loader: "elm-webpack-loader",
              options: {
                  // add Elm's debug overlay to output
                  debug: true,
                  //
                  forceWatch: true
              }
          }
      ]
    }
  )

  return {
    ...common,
    devServer: {
      inline: true,
      stats: { colors: true },
      historyApiFallback: true,
    },
  }
}

module.exports = env => {
  const common = {
    mode: env.production
      ? 'production'
      : 'development',
    
    entry: {
      app: [
        './src/index.js'
      ]
    },

    output: {
      path: path.resolve(__dirname + '/dist'),
      filename: '[name].js',
    },

    module: {
      rules: [
        {
          test: /\.css$/,
          use: [
            'style-loader',
            'css-loader',
          ]
        },
      ],
    },

    plugins: [
      new HtmlWebpackPlugin({
        template: path.join(SOURCE_DIR, 'index.html'),
        minify: {
          collapseWhitespace: true,
          removeComments: true
        }
        // favicon: path.resolve('./static/favicon.png')
      })
    ],
  }

  return env.production
   ? makeProdConfig(common)
   : makeDevConfig(common)
};
