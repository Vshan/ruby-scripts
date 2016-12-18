# Pre-requisites to run:
# Nokogiri (nokogiri.org)
# $ gem install nokogiri

require 'nokogiri'

file = File.open('steve-jobs.html')
html = Nokogiri::HTML(file)

name - html.at_css('#firstHeading').text
bday = html.at_css('.bday').text
dday = html.at_css('.dday').text
cause_of_death = html.at_xpath('//a[@title="Pancreatic cancer"]').text

output.write(name + 'was born on ' + bday + '\n')
output.write('He died on ' + dday + 'due to ' + cause_of_death)