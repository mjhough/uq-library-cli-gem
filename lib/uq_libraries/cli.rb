class UqLibraries::CLI

    def call
        welcome # Welcomes the user

        all_libraries # Iterates through all libraries and lists them with an index

        user_input # Takes the user input and calls methods depending on input
    end


    # Get library_array from scraper [DONE]

    # Welcome user [DONE]

    # Create Libraries [DONE WITH ERROR]

    # Display list of libraries to user from Library.all and puts out how busy they are with a status of BUSY / NORMAL / QUIET [DONE WITH ERROR]

    # Ask user for input and take that input to find Library in Library.all with index 

    # With the library found, puts each library level and it's details with a status of BUSY / NORMAL / QUIET


    def welcome
        puts "Welcome to the UQ Library Gem!"
        puts ""
    end

    def all_libraries
        UqLibraries::Library.create_from_collection(UqLibraries::Scraper.scrape_main_page)
        UqLibraries::Library.all
    end

    def display_libraries
        all_libraries.each.with_index(1) do |library, index|
            binding.pry
            puts "#{index}. #{library.name}: #{status(index)}"
        end
    end

    def status(index)
        library = all_libraries[index - 1]

        if library.total_available.to_i <= 0.3333333333 * library.total_out_of_available.to_i
            "BUSY".colorize(:red)
        elsif library.total_available.to_i > 0.3333333333 * library.total_out_of_available.to_i && library.total_available.to_i <= 0.666666666666 * library.total_out_of_available.to_i
            "NORMAL".colorize(:yellow)
        elsif library.total_available.to_i > 0.666666666666 * library.total_out_of_available.to_i
            "QUIET".colorize(:green)
        end
    end

    def list_libraries # Gets libraries from array and puts out their names preceded by their index starting at 1.
        UqLibraries::Library.all.each.with_index(1) do |library, index|
            puts "#{index}. #{library.name}"
        end

        # Example Output
            # 1. Architecture & Music Library
            # 2. Biological Sicences Library
            # 3. D.H. Engineering & Sciences Library
            # 4. Duhig Library
            # ...
    end

    def user_input # Takes the user input and calls methods depending on input
        input = nil
        while input != "exit"
            puts "\nSelect a library using its index number for more information"
            puts "If you need the list of libraries again type `list`"
            print "> "
            input = gets.strip.downcase

            if input.to_i.between?(1, 12)
                more_info(input.to_i - 1)
            elsif input == "list"
                list_libraries
            else
                puts "That's not a library! Enter the index number of a library (1-9) or type 'list' for a list of libraries"
            end
        end
        goodbye
    end

    def more_info(input) # Displays more information on the library using the input provided by the user (busy status for each level)
        details = UqLibraries::Library.all[input].details

        details.each do |level|
        puts "#{level[:level]} has #{level[:available]} out of #{level[:out_of_available]} computers available.\n".colorize(:green)
        end
    end

    def goodbye
        puts "Bye driver!"
    end
end