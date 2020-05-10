

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


    def self.list   #moved this out of cli class
        @restaurants = self.all
        @restaurants.each.with_index(1) do |rest, index|  
            puts "#{index}.".green.bold + " #{rest.name}".green
        end
    end


    def self.yes_more_restaurant_info(the_restaurant)  #moved this out of cli class
        rest = DenverVegan::Scraper.second_scrape(the_restaurant)
        #binding.pry
        puts ""
        puts "#{rest.name_header}".green.bold
        puts "#{rest.address}".green
        puts "#{rest.phone}".green   
        puts "#{rest.website}".green 
        puts "Cuisine: ".green.bold + "#{the_restaurant.cuisine}".green
        puts ""
        puts "#{rest.extended_review}".green

    end

end


 

 