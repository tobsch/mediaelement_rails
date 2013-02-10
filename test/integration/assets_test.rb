require "test_helper"

class AssetsTest < ActionDispatch::IntegrationTest

  test "includes full library" do
    get "/assets/mediaelement-and-player.js"
    assert_response :success
    assert content_type("text/javascript")
    assert response_includes?("var mejs = mejs || {}")
    assert response_includes?("mejs.MediaElementPlayer.prototype = {")
  end
  
  test "includes only mediaelement" do
    get "/assets/mediaelement-without-player.js"
    assert_response :success
    assert content_type("text/javascript")
    assert response_includes?("var mejs = mejs || {}")
    assert !response_includes?("mejs.MediaElementPlayer.prototype = {")
  end
  
  test "includes player stylesheet" do
    get "/assets/player.css"
    assert_response :success
    assert content_type("text/css")
    assert response_includes?(".mejs-container {")
    assert response_includes?(".mejs-mediaelement {")
  end
  
  test "includes player skins stylesheet" do
    get "/assets/player-skins.css"
    assert_response :success
    assert content_type("text/css")
    assert response_includes?(".mejs-container.mejs-ted {")
    assert response_includes?(".mejs-container.mejs-wmp {")
  end
  
  test "includes flash plugin" do
    get "/assets/mediaelement_rails/flashmediaelement.swf"
    assert_response :success
    assert content_type("application/x-shockwave-flash")
  end
  
  test "includes silverlight plugin" do
    get "/assets/mediaelement_rails/silverlightmediaelement.xap"
    assert_response :success
    assert content_type("application/x-silverlight-app")
  end
  
  {
    "background.png"      => "image/png",
    "bigplay.png"         => "image/png",
    "controls-ted.png"    => "image/png",
    "controls-wmp-bg.png" => "image/png",
    "controls-wmp.png"    => "image/png",
    "controls.png"        => "image/png",
    "loading.gif"         => "image/gif"
  }.each do |image, type|
    test "includes #{image[0..-5]} image" do
      get "/assets/mediaelement_rails/#{image}"
      assert_response :success
      assert content_type(type)
    end
  end

  # Returns true if the response includes the given content
  def response_includes?(content)
    @response.body.include?(content)
  end
  
  # Returns true if the response is of the given content type
  def content_type(type)
    @response.content_type == type
  end
end

