const { environment } = require('@rails/webpacker')

//To use jQuery and Bootstrap JS
const webpack = require('webpack')
environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: 'popper.js'
    })
)

module.exports = environment
