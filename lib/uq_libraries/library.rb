class UqLibraries::Library
    attr_accessor :name, :library_url, :total_available, :out_of_available
    @@all = []

    def initialize(library_hash)
        library_hash.each {|attribute, value| self.send("#{attribute}=", value)}
        @@all << self
    end

    def self.create_from_collection(libraries_array)
        libraries_array.each {|i| self.new(i)}
    end

    def add_attributes(details_array)
        details_array.each do |library_details_hash|
            library_details_hash.each do |attribute, value|
                self.send("#{attribute}=", value)
            end
        end
    end

    def self.all
        @@all
    end
end