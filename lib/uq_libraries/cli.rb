class UqLibraries::CLI

    def welcome
        puts "Welcome to the UQ Library Gem!"
        puts ""
    end

    def list_libraries
        puts <<-DOC.gsub /^\s*/, ''
            1. Architecture & Music Library
            2. Biological Sicences Library
            3. D.H. Engineering & Sciences Library
            4. Duhig Library
            ...

        DOC
    end

    def user_input
        input = nil
        while input != "exit"
            puts "\nSelect a library using its index number for more information"
            puts "If you need the list of libraries again type `list`"
            print "> "
            input = gets.strip.downcase

            case input
                when "1"
                    puts "More information on deal 1"
                when "2"
                    puts "More information on deal 1"
                when "3"
                    puts "More information on deal 1"
                when "4"
                    puts "More information on deal 1"
                when "list"
                    list_libraries
                else
                    puts "Whoa, baby! That's not a library."
            end
        end
        goodbye
    end

    def goodbye
        puts "Bye driver!"
    end
end