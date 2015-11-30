require 'RSpec'
require 'Watir'

browser = Watir::Browser.new :firefox

describe "logging in" do
	it "should enter email username and password into relevant fields" do
		
		browser.goto "http://tumblr.com/login"
		username = "tking@spartaglobal.com"
		password = "*******"
		
		browser.text_field(name: 'user[email]').set username
		browser.text_field(name: 'user[password]').set password
		
		expect(browser.text_field(name: 'user[email]').value).to eq(username)
		expect(browser.text_field(name: 'user[password]').value).to eq(password)
		
		browser.span(class:"signup_login_btn").click
	end
end

describe "Posting to blog" do
		it "should let user post once button is clicked"do
		browser.i(class:"icon_post_text").click
		
		expect(browser.div(class: "post-container").present?).to be true
	end
	it "should post to blog"do
		browser.div(class:'editor-plaintext').send_keys("Tumblr RSpec")
		browser.div(class:'editor-richtext').send_keys("automation test")
		browser.button(class: "blue").click
		browser.a(class:"post_avatar_link").when_present.click
		
		expect(browser.div(class:"posts").text).to include("Tumblr RSpec")
	end
end
