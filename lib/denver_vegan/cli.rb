class DenverVegan::CLI

    def call
        DenverVegan::Scraper.scrape_cntraveler
        #binding.pry
        list_vegan_restaurants
        menu
        goodbye
    end

    def list_vegan_restaurants
        puts 
        puts "Are You A Hungry Vegan In Denver?"       
         
        @restaurants = DenverVegan::Restaurant.all
        @restaurants.each.with_index(1) do |rest, index|  
            puts "#{index}. #{rest.name}"
            #puts "#{index}. #{rest.name} - #{rest.price_point} - #{rest.review_snippet}"
        end
     end
 
     def menu
         
         input = nil
         while input != "exit"
             puts "To choose the restaurant you'd like more info on:"
             puts "Select number from above, type list to see the restaurants again or type exit:"
             input = gets.strip

             if input.to_i > 0
                the_restaurant = @restaurants[input.to_i-1]
                puts "#{the_restaurant.name} - #{the_restaurant.price_point} - #{the_restaurant.review_snippet}"
             elsif input == "list"
                 list_vegan_restaurants  
             else
                 puts "Just like meat, that's not an option."
             end
         end
 
     end
 
     def goodbye
         puts "Thank you for eating your veggies!"
     end

end