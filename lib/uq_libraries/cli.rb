class UqLibraries::CLI

    def call
        welcome # Welcomes the user

        list_libraries # Iterates through all libraries and lists them with an index

        user_input # Takes the user input and calls methods depending on input
    end


    # Get library_array from scraper

    # Welcome user

    # Create Library

    # Display list of libraries to user from Library.all and puts out how busy they are with a status of BUSY / NORMAL / QUIET

    # Ask user for input and take that input to find Library in Library.all with index

    # With the library found, puts each library level and it's details with a status of BUSY / NORMAL / QUIET


    def welcome
        puts "Welcome to the UQ Library Gem!"
        puts ""
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

            if input == 1..12
                more_info(input)
            elsif input == "list"
                list_libraries
            else
                puts "That's not a library! Enter the index number of a library (1-9) or type 'list' for a list of libraries"
            end
        end
        goodbye
    end

    def more_info(input) # Displays more information on the library using the input provided by the user (busy status for each level)
        UqLibraries::Library.all[input].info
    end

    def goodbye
        puts "Bye driver!"
    end
end