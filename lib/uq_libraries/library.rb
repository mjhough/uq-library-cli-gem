class UqLibraries::Library
    attr_accessor :name, :library_url, :total_available, :total_out_of_available, :details
    @@all = []

    def initialize(library_hash)
        library_hash.each {|attribute, value| self.send("#{attribute}=", value)}
        add_details
        @@all << self
    end

    def self.create_from_collection(libraries_array)
        libraries_array.each {|i| self.new(i)}
    end

    def self.all
        @@all
    end

    def add_details
        @details = UqLibraries::LibraryDetails.create_from_collection(UqLibraries::Scraper.scrape_details_page(@library_url))
    end
end