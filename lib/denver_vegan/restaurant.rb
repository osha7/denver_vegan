class DenverVegan::Restaurant
    attr_accessor :name, :price, :review_snippet, :url
 
    def self.vegan_restaurant
         
        puts <<-DOC.gsub /^\s*/, ''
          1. Hoja - $$ - xyz is abc
          2. Beet Box - $ - cde is fng
        DOC
 
         restaurant_1 = self.new
         restaurant_1.name = "Hoja"
         restaurant_1.price = "$$"
         restaurant_1.review_snippet = "xyz is abc"
         restaurant_1.url = "https://www.cntraveler.com/gallery/best-vegan-and-vegetarian-restaurants-in-denver"
 
         restaurant_2 = self.new
         restaurant_2.name = "Beet Box"
         restaurant_2.price = "$"
         restaurant_2.review_snippet = "cde is fng"
         restaurant_2.url = "https://www.cntraveler.com/gallery/best-vegan-and-vegetarian-restaurants-in-denver"
 
        [restaurant_1, restaurant_2] 
 
    end
 
 end
 