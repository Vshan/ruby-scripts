require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://iris.nitk.ac.in/hrms"

email = driver.find_element(id: 'user_login')
email.send_keys "sbs.191197@gmail.com"

password = driver.find_element(id: 'user_password')
password.send_keys "salman-bhai"

submit = driver.find_element(:tag_name, 'button').click

assert(false, 1>2)

# driver.quit