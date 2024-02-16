class Link < ApplicationRecord
    # Validates that there is a URL present 
    validates_presence_of :url
    #generates regular expressions ensuring that the link begins with either 'http' or 'https' 
    #Ensures format of a valid URL
    validates :url, format: URI::regexp(%w[http https])
    # Validates that the slug itself is unique in the db
    validates_uniqueness_of :slug
    # Assuming that no url is greater than 255 characters and not less than 3
    validates_length_of :url, within: (3..255), on: :create, message: 'too long'
    # Assuming that no slug is greater than 255 characters and not less than 3 
    # The slug is the generated key for the url, eg 'https://me.com/saruni' 'saruni' is the slug
    validates_length_of :slug, within: (3..255), on: :create, message: 'too long'

    def short
        # Rails.application.routes.url_helpers allows for us to access the url helper methods by rails
        # Here we call the 'short_url' which generates a slug for the URL
        Rails.application.routes.url_helpers.short_url(slug: self.slug, only_path: true)
    end

    
end
