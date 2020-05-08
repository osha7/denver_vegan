

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
        system("clear")
        puts ""
        puts "                       Welcome!".green.bold
        puts ""
        puts "We've made a list of some of the best plant chompin' restaurants in Denver!".green
        puts ""
        puts "Are You A Hungry Vegan In Denver? (y/n)"    
        input = gets.strip.downcase
            if input == "y"
                puts ""
                puts "Retrieving our list...".black.on_green
                puts "This might take a second.".black.on_green
                puts ""
            list_vegan_restaurants
            elsif input == "n"
                puts ""
                puts "Must have had some real bad veg sides as a kid!"
                puts ""
                exit
            else
                puts ""
                puts "Just like meat, that's not an option.".yellow
                welcome
    end
    end


    def list_vegan_restaurants
        @restaurants = DenverVegan::Restaurant.all
        @restaurants.each.with_index(1) do |rest, index|  
            puts "#{index}.".green.bold + " #{rest.name}".green
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
            puts "    **********************************************************".green
            puts "    *                  *                  *                  *".green
            puts "    * CHOOSE A NUMBER  *       LIST       *       EXIT       *".bold
            puts "    *                  *                  *                  *".green
            puts "    **********************************************************".green
            puts "                               ****".green
             puts "See a restaurant you'd like more info on? Select a number from above:"
             puts "Type 'list' at anytime to see the restaurant list again."
             puts "Typing 'exit' will get you outta here fast!"
             input = gets.strip.downcase

                if input.to_i > 0 && input.to_i <= DenverVegan::Restaurant.all.length
                    system("clear")
                    the_restaurant = @restaurants[input.to_i-1]
                    puts ""
                    puts "#{the_restaurant.name}".black.on_green + " - #{the_restaurant.price_point} - #{the_restaurant.review_snippet}".green
                    puts ""
                    puts "How's this sounding?  Would you like more info: (y/n)"
                    input = gets.strip.downcase
                        if input == "y"
                            DenverVegan::Restaurant.yes_more_restaurant_info(the_restaurant)

                        elsif input == "n"
                            puts ""
                            puts "Let us grab that list for you again.".green
                            puts ""
                            list_vegan_restaurants
                        else 
                            puts "Just like meat, that's not an option.".yellow
                            puts "Let's try again with the original menu."
                        end
                    sleep 5

                    
                elsif input == "list"
                    list_vegan_restaurants
                elsif input == "exit"  
                    puts ""  
                    puts "Thank you for eating your veggies!".green.bold
                else
                    puts ""
                    puts "Just like meat, that's not an option.".yellow
                    sleep 1
                end
         end
     end
 
     def goodbye
        puts "Now, go get some grub!".green
        puts ""
        puts ""
     end

end