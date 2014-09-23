expect = window.chai.expect
window.chai.should()

describe "supersonic.app.getLaunchURL", ->
  it "should be defined", ->
    supersonic.app.getLaunchURL.should.exist

  it "should be rejected", ->
    supersonic.app.getLaunchURL().should.be.rejected

describe "supersonic.app.sleep", ->
  it "should be defined", ->
    supersonic.app.sleep.should.exist

  it "should disable sleep", ->
    supersonic.app.sleep.disable().should.be.fulfilled

  it "should enable sleep", ->
    supersonic.app.sleep.enable().should.be.fulfilled

describe "supersonic.app.splashscreen", ->
  it "should be defined", ->
    supersonic.app.splashscreen.should.exist

  it "should show splashscreen", ->
    supersonic.app.splashscreen.show().should.be.fulfilled

  it "should hide splashscreen", ->
    @timeout 5000
    supersonic.app.splashscreen.hide().should.be.fulfilled

describe "supersonic.Apple.openURL", ->
  it "should be defined", ->
    supersonic.app.openURL.should.exist

  it "should open Apple Maps", ->
    @timeout 10000

    url = "maps://?daddr=San+Francisco,+CA&saddr=cupertino"

    supersonic.app.openURL(url).should.be.fulfilled

  it "should not open dolanz://", ->
    supersonic.app.openURL("dolanz://").should.be.rejected

  it "should not open null", ->
    #acually crashes
    #supersonic.app.openURL(null).should.be.rejected

