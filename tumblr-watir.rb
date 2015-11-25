$LOAD_PATH<<'.'
require 'Watir'
require 'yaml'
require 'browser_mod'
require 'login_mod'

include UseBrowser

browser = UseBrowser.browser_init
browser.goto "http://tumblr.com/login"

include Log


log = browser.span(class:"signup_login_btn")
log.click

post = browser.i(class:"icon_post_text")
post.click

title = browser.div(class:'editor-plaintext')
title.click
title.send_keys("Watir automation")

body = browser.div(class:'editor-richtext')
body.click
body.send_keys("this is was posted using Watir")

verify = body.text
#include Post_to_blog

submit_post = browser.button class: "blue"
submit_post.click

#accessing the blog
blog = browser.a(class:"post_avatar_link")
blog.click

view_t = browser.div(class:"post_title")
view_b = browser.div(class:"post_body")
success = browser.div(class:"post_body")

if view_b.text == verify
  puts "posting successful! the post is called #{view_t.text}"
else
  puts "post is not displayed on the blog"
end

puts view_t.text
puts view_b.text
puts verify