


class DenverVegan::Scraper

   

    def self.scrape_cntraveler
        url = "https://www.cntraveler.com/gallery/best-vegan-and-vegetarian-restaurants-in-denver"
        page = Nokogiri::HTML(open(url))

        #binding.pry
        page.css("div.image-content-container").each do |restaurant| 
            new_restaurant = DenverVegan::Restaurant.new
       #binding.pry
            new_restaurant.name = restaurant.css("h2.hed").text
            new_restaurant.price_point = restaurant.search("p.price").text
            new_restaurant.review_snippet = restaurant.search("div.dek p").text
        end
    end


    
    #DenverVegan::Scraper.scrape_cntraveler
 

end
