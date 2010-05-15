class GoogleImageScraper
  def self.find_first_image_for_keyword(keyword)
    require 'net/http'
    require 'rest_client'
    require 'nokogiri'
    require 'tempfile'

    query     = build_query keyword
    response  = Net::HTTP.get_response URI.parse query
    html      = Nokogiri::HTML response.body

    image_url = html.css('img')[1]['src']

    response  = Net::HTTP.get URI.parse image_url
    File.open("#{RAILS_ROOT}/public/#{keyword}.jpg", 'w') {|f| f.write response}

    "#{keyword}.jpg"
  end

  def self.build_query(keyword)
    "http://www.google.ca/images?hl=en&q=#{keyword}&um=1&ie=UTF-8&source=og&sa=N&tab=wi"
  end
end
