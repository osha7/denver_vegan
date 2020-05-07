class DenverVegan::CLI

    def call
        welcome
        DenverVegan::Scraper.initial_scrape
        full_review
        list_vegan_restaurants
        menu
        goodbye

    end

    def welcome
        puts ""
        puts "Welcome!"
        puts "We've made a list of some of the best plant chompin' restaurants in Denver!"
        puts ""
        puts "Are You A Hungry Vegan In Denver? (y/n)"    
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
            # puts "#{index}. #{rest.name} - #{rest.address}"
            #puts "#{index}. #{rest.name} - #{rest.price_point} - #{rest.review_snippet}"
        end
    end

    def full_review

        
        @restaurants = DenverVegan::Restaurant.all
        @restaurants.each do |rest|
            DenverVegan::Scraper.second_scrape(rest)
        end
    end

    
     def menu
         
         input = nil
         while input != "exit" && input != "EXIT"
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
                    system("clear")
                    the_restaurant = @restaurants[input.to_i-1]
                    puts ""
                    puts "#{the_restaurant.name} - #{the_restaurant.price_point} - #{the_restaurant.review_snippet}"
                    sleep 5
                    
                elsif input == "list"
                    list_vegan_restaurants
                elsif input == "exit"  
                    puts ""  
                    puts "Thank you for eating your veggies!"
                else
                    puts "Just like meat, that's not an option."
                end
         end
     end
 
     def goodbye
        puts "Now, go get some grub!"
     end

end