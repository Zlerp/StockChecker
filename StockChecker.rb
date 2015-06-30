require 'httparty'
require 'nokogiri'

puts "Please enter a stock symbol.", "(for example: AAPl)"
stock = gets.chomp.upcase
# stock = "L"
url = "http://finance.yahoo.com/q?s=" + stock.to_s

# goes to the URL page
response = HTTParty.get(url)

# Takes the input from response, 
dom = Nokogiri::HTML(response.body)

# finds price element @ path:
stock_ele_path = "//span[@id='yfs_l84_#{stock.downcase}']"

#finds name elements
stock_ele_name = dom.xpath('.//h2')
#  finds elements with specified string.
listResult = dom.xpath(stock_ele_path)

# Converts name h2 elements to array
name = stock_ele_name.to_a

#grabs first item from listResult which is the price.
price = listResult.first

# You must use '.text' in order to get the xpath to convert to human.
puts "The current price for #{name[2].text} is $#{price.text}"


