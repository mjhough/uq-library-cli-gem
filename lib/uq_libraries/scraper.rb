class UqLibraries::Scraper

    @base_url = "https://www.library.uq.edu.au/uqlsm/"
    @main_page = "availablepcsembed.php"
    @main_url = "#{@base_url}#{@main_page}"
    

    def self.scrape_main_page
        libraries = []
        frontpage = Nokogiri::HTML(open(@main_url))

        frontpage.css(".chart tr").each do |row|
            name = row.css("a[href]").text

            total_available = row.css(".right").text.split(" ")[0]
            out_of_available = row.css(".right").text.split(" ")[3]

            library_page = row.css("a[href]")[0]["href"]
            library_url = "#{@base_url}#{library_page}"

            libraries << {name: name, total_available: total_available, out_of_available: out_of_available, library_url: library_url}
        end
        libraries
    end

    def self.scrape_details_page(library_url)
        details_page = Nokogiri::HTML(open(library_url))

        library_name = details_page.css("h3")
        test = details_page.css("table tr").collect do |level|
            case level.css("a[href]").text.downcase
                when "level 1"
                    name = level.css("a[href]").text
                    total_available = level.css(".right").text.split(" ")[0]
                    out_of_available = level.css(".right").text.split(" ")[3]
                    level = {name: name, total_available: total_available, out_of_available: out_of_available}
                when "level 2"
                    name = level.css("a[href]").text
                    total_available = level.css(".right").text.split(" ")[0]
                    out_of_available = level.css(".right").text.split(" ")[3]
                    level = {name: name, total_available: total_available, out_of_available: out_of_available}
                when "level 3"
                    name = level.css("a[href]").text
                    total_available = level.css(".right").text.split(" ")[0]
                    out_of_available = level.css(".right").text.split(" ")[3]
                    level = {name: name, total_available: total_available, out_of_available: out_of_available}
                when "level 4"
                    name = level.css("a[href]").text
                    total_available = level.css(".right").text.split(" ")[0]
                    out_of_available = level.css(".right").text.split(" ")[3]
                    level = {name: name, total_available: total_available, out_of_available: out_of_available}
                when "level 5"
                    name = level.css("a[href]").text
                    total_available = level.css(".right").text.split(" ")[0]
                    out_of_available = level.css(".right").text.split(" ")[3]
                    level = {name: name, total_available: total_available, out_of_available: out_of_available}
                when "level 6"
                    name = level.css("a[href]").text
                    total_available = level.css(".right").text.split(" ")[0]
                    out_of_available = level.css(".right").text.split(" ")[3]
                    level = {name: name, total_available: total_available, out_of_available: out_of_available}
                # else
                #     puts "ERROR: #{level.css("a[href]").text.downcase}"
                #     raise "There was an issue. Please submit an issue on GitHub: https://github.com/Tolenno/uq-library-cli-gem with a screenshot of the error".colorize(:red)
            end
        end.compact
    end
end

# library_levels << {
#     "#{library_name}" => {
#         level_one: level_one_hash,
#         level_two: level_two_hash,
#         level_three: level_three_hash,
#         level_four: level_four_hash, 
#         level_five: level_five_hash,
#         level_six: level_six_hash
#     }
# }

# UqLibraries::Scraper.scrape_details_page("https://www.library.uq.edu.au/uqlsm/availablepcsembed.php?branch=BSL")

# UqLibraries::Scraper.scrape_details_page(library_url)