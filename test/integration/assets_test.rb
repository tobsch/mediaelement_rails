require "test_helper"
require "capybara/rails"

class AssetsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  
  test "MediaElement javascript" do
    visit "/assets/mediaelement-and-player.js"
    assert page.has_content?("jQuery JavaScript Library v1.6.2")
    assert page.has_content?("var mejs = mejs || {}")
    assert page.has_content?("mejs.MediaElementPlayer.prototype = {")
  end
  
  test "MediaElement without player javascript" do
    visit "/assets/mediaelement-without-player.js"
    assert page.has_no_content?("jQuery JavaScript Library v1.6.2")
    assert page.has_content?("var mejs = mejs || {}")
    assert page.has_no_content?("mejs.MediaElementPlayer.prototype = {")
  end
  
  test "MediaElement player stylesheet" do
    visit "/assets/player.css"
    assert page.has_content?(".mejs-container {")
    assert page.has_content?(".mejs-mediaelement {")
  end
  
  test "MediaElement player skins stylesheet" do
    visit "/assets/player-skins.css"
    assert page.has_content?(".mejs-container.mejs-ted {")
    assert page.has_content?(".mejs-container.mejs-wmp {")
  end
end

