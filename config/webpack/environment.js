const { environment } = require('@rails/webpacker')
// 以下を追記
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

environment.config.merge({
  performance: {
    hints: false
  }
})

// ここまで
module.exports = environment
