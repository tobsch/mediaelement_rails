##  MediaelementRails ##
This neat project brings the cool MediaElement.js html5/flash/silverlight video-player to the rails world.
It requires rails 3.1 engines (tested with 3.1 rc5) and makes integration pretty easy.

## All you have to do is: ##
1. Add the gem to the list of required gems in your Gemfile
2. Load the Mediaelement Javascript in your application.js:
    //= require 'mediaelement_rails'

3. Load the Mediaelement css in your application.css:
    //= require 'mediaelement_rails'


## Wanna use MediaElement (not the player) only? ##
This is easy as hell too! 
Don't include any css and include the following Javascript in your application.js to get it working:
    //= require 'mediaelement_rails/rails'

This project rocks and uses MIT-LICENSE.