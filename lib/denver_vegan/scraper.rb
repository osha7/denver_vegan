

class DenverVegan::Scraper

    def self.initial_scrape
        url = "https://www.cntraveler.com/gallery/best-vegan-and-vegetarian-restaurants-in-denver"
        page = Nokogiri::HTML(open(url))

        #binding.pry
        page.css("div.image-content-container").each do |restaurant| 
            new_restaurant = DenverVegan::Restaurant.new
       #binding.pry
            new_restaurant.name = restaurant.css("h2.hed").text
            new_restaurant.price_point = restaurant.css("p.price").text
            new_restaurant.review_snippet = restaurant.css("div.dek p").text
            new_restaurant.url = restaurant.css("a").attr("href").value #/denver/restaurant-name, meaning base url was actually cntraveler.com/restaurants
            
    #image_content_container = parsed_page_html_elements.css('.image-content-container')
                 #when in pry: type in 'image_content_container[0] to see the first element 
        end
    end

    def self.second_scrape(restaurant)
       # binding.pry
        base_url = "http://cntraveler.com"
        page = open("#{base_url}" + "#{restaurant.url}")
        parsed_page_html_elements = Nokogiri::HTML(page)
        
            restaurant.name_header = parsed_page_html_elements.css("h1.venue__name").text
            restaurant.address = parsed_page_html_elements.css("address p").text
            restaurant.phone = parsed_page_html_elements.css("div p.venue__phone").text
            restaurant.website = parsed_page_html_elements.css("div p.venue__url").text
            restaurant.cuisine = parsed_page_html_elements.css("p.feature-item").text
            restaurant.extended_review = parsed_page_html_elements.css("div.description-wrapper p")[3].text
            restaurant
    end
    
end
    

    # use this in the binding.pry: (running ./bin/console)
    # DenverVegan::Scraper.second_scrape

 


