#  MediaelementRails #

This neat project brings the cool [MediaElement.js](http://mediaelementjs.com/) (HTML5/Flash/Silverlight video player) to the Rails asset pipeline. __*NOTE:*__ This gem requires jquery, which shouldn't be an issue.

## All you have to do is: ##

Add the gem to the list of required gems in your `Gemfile`:

``` ruby
# ...
gem "mediaelement_rails"
# ...
```

### Javascript ###

Load the Mediaelement Javascript in your `application.js`:

``` javascript
//= require mediaelement_rails
```

### And CSS ###

Load the Mediaelement CSS in your `application.css`:

``` css
/*
 *= require mediaelement_rails
 * and optionally:
 *= require mediaelement_rails/mejs-skins
 */
```

## Wanna use MediaElement (not the player) only? ##

This is easy as hell too! 
Don't include any CSS and include the following in your `application.js` to get it working:

``` javascript
//= require mediaelement_rails/rails
```

## Anything else I should know? ##

Nothing special! This project includes all assets you might need.

This project rocks and uses MIT-LICENSE.