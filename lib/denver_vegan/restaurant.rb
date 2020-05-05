class DenverVegan::Restaurant
    attr_accessor :name, :price, :review_snippet, :url
 
    def self.vegan_restaurant
        self.scrape_restaurants
    end

    def self.scrape_restaurants
        restaurants = []

        restaurants << self.scrape_cntraveler

        restaurants
    end

    def self.scrape_cntraveler
        #  url = "https://www.cntraveler.com/gallery/best-vegan-and-vegetarian-restaurants-in-denver"
        doc = Nokogiri::HTML(open("https://www.cntraveler.com/gallery/best-vegan-and-vegetarian-restaurants-in-denver"))
        doc.css("div.image-content-container").each do |restaurant|
            # name = restaurant.css("h2.hed").text
            # price =  restaurant.css("p.price").text
            # review_snippet =  restaurant.css("div.dek p").text

        binding.pry
        end
    end

 
 end
 