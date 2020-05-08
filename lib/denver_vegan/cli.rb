class DenverVegan::CLI

    def call
        welcome
        DenverVegan::Scraper.initial_scrape
        extended_option
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
                puts ""
                puts "Retrieving our list."
                puts "This might take a second."
                puts ""
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

    def extended_option
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
                    puts ""
                    puts "How's this sounding?  Would you like more info: (y/n)"
                    input = gets.strip.downcase
                        if input == "y"
                            # DenverVegan::Restaurant.yes_more_restaurant_info
                            # the_restaurant = @restaurants
                            puts ""
                            puts "#{the_restaurant.name_header}"
                            puts "#{the_restaurant.address}"
                            puts "#{the_restaurant.phone}"
                            puts "#{the_restaurant.website}"
                            puts "#{the_restaurant.cuisine}"
                            puts ""
                            puts "#{the_restaurant.extended_review}"
                        elsif input == "n"
                            puts ""
                            puts "Let us grab that list for you again."
                            puts ""
                            list_vegan_restaurants
                        else 
                            puts "Just like meat, that's not an option."
                        end
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
        puts ""
        puts ""
     end

end