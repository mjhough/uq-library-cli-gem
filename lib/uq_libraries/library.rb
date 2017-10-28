class UqLibraries::Library
    attr_accessor :name, :library_url, :total_available, :out_of_available, :details
    @@all = []

    def initialize(library_hash)
        library_hash.each {|attribute, value| self.send("#{attribute}=", value)}
        @@all << self
    end

    def self.create_from_collection(libraries_array)
        libraries_array.each {|i| self.new(i)}
    end

    def self.all
        @@all
    end
end