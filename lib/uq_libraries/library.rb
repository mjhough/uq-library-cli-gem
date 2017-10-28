class UqLibraries::Library
    attr_accessor :name, :url, :total_available, :out_of_available

    def initialize(library_hash)
        library_hash.each {|attribute, value| self.send("#{attribute}=", value)}
        @@all << self
    end
end


# Initialize a library from the libraries and add itself to @all
    # name
    # url
    # total_avilable
    # out_of_available