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

            libraries << {name: name, total_available: total_available, total_out_of_available: out_of_available, library_url: library_url}
        end
        libraries
    end

    def self.scrape_details_page(library_url)
        details_page = Nokogiri::HTML(open(library_url))

        test = details_page.css("table.chart tr").collect do |level|
            right = level.css(".right").text.split
            {level: level.css("a[href]").text, available: right[0], out_of_available: right[3]}
        end
    end
end