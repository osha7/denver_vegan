

class DenverVegan::Restaurant

    attr_accessor :name, :price_point, :review_snippet, :full_review, :url, :address

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

    def list_vegan_restaurants

        @restaurants = self.all
        @restaurants.each.with_index(1) do |rest, index|  
        puts "#{index}. #{rest.name}"
            # puts "#{index}. #{rest.name} - #{rest.address}"
            #puts "#{index}. #{rest.name} - #{rest.price_point} - #{rest.review_snippet}"
        end
    end


end

#     #DenverVegan::Restaurant.scrape_cntraveler
 

 