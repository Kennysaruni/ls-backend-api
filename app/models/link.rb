class Link < ApplicationRecord
    before_validation :generate_slug

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

    def generate_slug
        self.slug = SecureRandom.uuid[0..5] if self.slug.nil? || self.slug.empty?
        true
    end


    def short
        # Rails.application.routes.url_helpers allows for us to access the url helper methods by rails
        # Here we call the 'short_url' which generates a slug for the URL
        Rails.application.routes.url_helpers.short_url(slug: self.slug, only_path: true)
    end

    def self.shorten(url, slug='')
        # return short when URL with that slug was created before
        link =Link.where(url: url, slug: slug).first
        return link.short if link

        # Creates a new URL
        link= Link.new(url: url, slug: slug)
        return link.short if link.save

        # If the slug is taken, add new characters to it
        # Also generates a random slug on the chance that there is no slug present
        Link.shorten(url, slug+SecureRandom.uuid[0..7])
    end

end
