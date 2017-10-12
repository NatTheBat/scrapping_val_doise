	require 'rubygems'
	require 'open-uri'
	require 'nokogiri'


def get_all_the_urls_of_val_doise_townhalls()
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		links = page.css("a.lientxt")
		liste = links.each{|departement| puts 'http://annuaire-des-mairies.com/' + departement['href']}
end

def  get_the_email_of_a_townhal_from_its_webpage(url)
	page2 = Nokogiri::HTML(open(url))
	page2.css('p:contains("@")').each do |email|
	puts email.text
	end
end

tableau = get_all_the_urls_of_val_doise_townhalls 

tableau.each do |url|
	get_the_email_of_a_townhal_from_its_webpage(url) 
end



	