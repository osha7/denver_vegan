class DenverVegan::Restaurant
    attr_accessor :name, :price_point, :review_snippet, :full_review

    @@all = []

   def initialize(name=nil, price_point=nil, review_snippet=nil)
    @name = name
    @price_point = price_point
    @review_snippet = review_snippet
    @full_review = full_review
    @@all << self
    
   end

   def self.all
    @@all
   end

end

#     #DenverVegan::Restaurant.scrape_cntraveler
 

 