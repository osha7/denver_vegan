class DenverVegan::CLI

    def call
        
        list_vegan_restaurants
        menu
        goodbye
    end

    def list_vegan_restaurants
         puts "Are You A Hungry Vegan In Denver?"       
         
        @restaurants = DenverVegan::Restaurant.vegan_restaurant 
        @restaurants.each.with_index(1) do |rest, index|  
            puts "#{index}. #{rest.name} - #{rest.price} - #{rest.review_snippet}"
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
                puts "#{the_restaurant.name} - #{the_restaurant.price} - #{the_restaurant.review_snippet}"
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