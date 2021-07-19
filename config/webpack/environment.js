const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.append(
   "Provide",
     new webpack.ProvidePlugin({
    	$: 'jquery/src/jquery',
    	jQuery: 'jquery/src/jquery',
	Popper: ['@popperjs/core']
      })
);
                   
module.exports = environment
