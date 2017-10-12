	require 'rubygems'
	require 'open-uri'
	require 'nokogiri'


def get_all_the_urls_of_val_doise_townhalls()
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		links = page.css("a.lientxt")
		liste = links.each{|departement| puts 'http://annuaire-des-mairies.com/' + departement['href']}
end

get_all_the_urls_of_val_doise_townhalls 





page2 = Nokogiri::HTML(open())
page2.css('p:contains("@")').each do |email|
puts email.text
end




	