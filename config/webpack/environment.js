const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default'], // for Bootstrap 4

    // Include Clipboard.js with a rename since it conflicts with
    // Chrome's own upcoming Clipboard API.
    ClipboardJS: 'clipboard'
  })
)


module.exports = environment
