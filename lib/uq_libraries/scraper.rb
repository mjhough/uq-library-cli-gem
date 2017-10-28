class UqLibraries::Scraper

    @base_url = "https://www.library.uq.edu.au/uqlsm/"
    @main_page = "availablepcsembed.php"
    @main_url = "#{@base_url}#{@main_page}"
    

    def self.scrape_main_page(main_url)
        libraries = []
        frontpage = Nokogiri::HTML(open(main_url))
        
        frontpage.css(".chart tr").each do |row|
            name = row.css("a[href]").text

            total_available = row.css(".right").text.split(" ")[0]
            out_of_available = row.css(".right").text.split(" ")[3]

            library_page = row.css("a[href]")[0]["href"]
            library_url = "#{@base_url}#{library_page}"

            libraries << {name: name, available: available, out_of_available: out_of_available, library_url: library_url}
        end
    end

    def self.scrape_details_page(library_url) #Incomplete
        library_levels = []
        details_page = Nokogiri::HTML(open(library_url))

        details_page.css("a[href]")

            level_one = nil
            level_two = nil
            level_three = nil
            level_four = nil
            level_five = nil
            level_six = nil

        library_levels << {level_one: level_one, level_two: level_two, level_three: level_three, level_four: level_four, level_five: level_five, level_six: level_six}
    end
end



# name = "a href" text
# time = ".uqtext" text
# available_pcs = ".right" text