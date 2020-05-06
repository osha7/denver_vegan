class DenverVegan::CLI

    def call
        welcome
        DenverVegan::Scraper.scrape_cntraveler
        #binding.pry
        list_vegan_restaurants
        menu
        goodbye
    end

    def welcome
        puts ""
        puts "Welcome!"
        puts "We have compiled some of the best restaurants in Denver, where you can eat plants 'til your hearts content!"
        puts ""
        puts "Are You A Hungry Vegan In Denver?"    
        input = gets.strip.downcase
            if input == "y"
            list_vegan_restaurants
            elsif input == "n"
                puts ""
                puts "Must have had some real bad veg sides as a kid!"
                exit
            else
                puts ""
                puts "Just like meat, that's not an option."
                welcome
    end
    end


    def list_vegan_restaurants

        @restaurants = DenverVegan::Restaurant.all
        @restaurants.each.with_index(1) do |rest, index|  
            puts "#{index}. #{rest.name}"
            #puts "#{index}. #{rest.name} - #{rest.price_point} - #{rest.review_snippet}"
        end
    end
 
    
     def menu
         
         input = nil
         while input != "exit"
            puts ""
            puts "    **********************************************************"
            puts "    *                  *                  *                  *"
            puts "    * CHOOSE A NUMBER  *       LIST       *       EXIT       *"
            puts "    *                  *                  *                  *"
            puts "    **********************************************************"
             puts "See a restaurant you'd like more info on? Select a number from above:"
             puts "Type 'list' at anytime to see the restaurant list again."
             puts "Typing 'exit' will get you outta here fast!"
             input = gets.strip.downcase

                if input.to_i > 0
                    the_restaurant = @restaurants[input.to_i-1]
                    puts ""
                    puts "#{the_restaurant.name} - #{the_restaurant.price_point} - #{the_restaurant.review_snippet}"
                    
                elsif input == "list"
                    list_vegan_restaurants
                elsif input == "exit"    
                   puts "Thank you for eating your veggies!"
                else 
                    puts "Just like meat, that's not an option."
                end

         end
 
     end
 
     def goodbye
        puts ""
        puts "Now, go get some grub!"
     end

end