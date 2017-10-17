	require 'rubygems'
	require 'open-uri'
	require 'nokogiri'


# Récupérer les URL des sites internets de toutes les mairies du Val d'Oise et les mettre dans un tableau
def get_all_the_urls_of_val_doise_townhalls()
		tableau = []
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		links = page.css("a.lientxt")
		liste = links.each{|departement| tableau << 'http://annuaire-des-mairies.com/' + departement['href']}

		return tableau

end

tableau = get_all_the_urls_of_val_doise_townhalls


#Récupérer l'email de la mairie dans une page donnée


def  get_the_email_of_a_townhall_from_its_webpage(page_url)
	page2 = Nokogiri::HTML(open(page_url))
	page2.css('p:contains("@")').each do |email|
	puts email.text
	end
end

#assembler les 2
liste_emails = []
liste_emails << tableau.each do |url|
	get_the_email_of_a_townhall_from_its_webpage(url) 
end
	