

class DenverVegan::Restaurant

    attr_accessor :name, :price_point, :review_snippet, :url, :name_header, :address, :phone, :website, :cuisine, :extended_review

    @@all = []

    def initialize(name=nil, price_point=nil, review_snippet=nil, url=nil)
        @name = name
        @price_point = price_point
        @review_snippet = review_snippet
        #@full_review = full_review
            #things that don't need to be present when the instance is created don't need to be in initialize
        @url = url
        @@all << self 
    end

    def self.all
        @@all
    end

    # def self.yes_more_restaurant_info()
    #     # @restaurants = DenverVegan::Scraper.second_scrape
    #     # @restaurants.each do |rest|
    #     puts ""
    #     puts "#{restaurant.name_header}"
    #     puts "#{restaurant.address}"
    #     puts "#{restaurant.phone}"
    #     puts "#{restaurant.website}"
    #     puts "#{restaurant.cuisine}"
    #     puts ""
    #     puts "#{restaurant.extended_review}"
    #     #end

    # end

end


 

 