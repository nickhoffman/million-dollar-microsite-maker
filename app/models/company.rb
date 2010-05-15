class Company
  attr_accessor :name
  attr_accessor :address
  attr_accessor :phone_number
  attr_accessor :email_address
  attr_accessor :company_id
  attr_accessor :url
  attr_accessor :canpages_url
  attr_accessor :city
  attr_accessor :province
  attr_accessor :postal_code
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :listing_type

  def initialize(options)
    @name           = options[:Name]
    @address        = options[:Address]
    @phone_number   = options[:Phone]
    @email_address  = options[:Email]
    @company_id     = options[:CompanyId].to_i
    @url            = options[:Url]
    @canpages_url   = options[:PageUrl]
    @city           = options[:City]
    @province       = options[:Province]
    @postal_code    = options[:PostalCode]
    @latitude       = options[:Latitude]
    @longitude      = options[:Longitude]
    @listing_type   = options[:ListingType]
  end
end
