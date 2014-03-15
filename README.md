#  MediaelementRails #

This neat project brings the cool [MediaElement.js](http://mediaelementjs.com/) 2.13.2 (HTML5/Flash/Silverlight video player) to the Rails asset pipeline. __*NOTE:*__ This gem requires jquery to be included, which shouldn't be an issue.

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

## Todo ##

- Add support for `flashmediaelement-cdn.swf` for cases when the assets are hosted on a different domain than the rails application.
- Setup [appraisal](https://github.com/thoughtbot/appraisal) gem to test against rails 3.x and 4.x

## Maintainers ##

- [Mark Oleson](https://github.com/fusion2004) - current
- [Tobias Schlottke](https://github.com/tobsch)
- [Pete Browne](https://github.com/petebrowne)

## License ##

This project rocks and uses MIT-LICENSE.
