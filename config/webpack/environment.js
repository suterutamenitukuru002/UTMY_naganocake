const { environment } = require('@rails/webpacker')

module.exports = environment

<<<<<<< HEAD
=======

>>>>>>> origin/develop
// jQueryの設定

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
<<<<<<< HEAD
=======

>>>>>>> origin/develop
