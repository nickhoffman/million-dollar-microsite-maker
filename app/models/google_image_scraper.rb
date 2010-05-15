class GoogleImageScraper
  def self.find_first_image_for_keyword(keyword)
    require 'net/http'
    require 'nokogiri'
    require 'json'

    query     = build_query keyword
    response  = Net::HTTP.get_response URI.parse query
    html      = Nokogiri::HTML response.body

    image_url = html.css('img')[1]['src']

    response  = Net::HTTP.get URI.parse image_url
    google_image = "#{RAILS_ROOT}/public/#{keyword}.jpg"
    File.open(google_image, 'w') {|f| f.write response}

    curl_output = `curl -s 'http://204.15.199.173:8000/rest/' -F "method=visual_search" -F "image=@#{google_image};filename=#{keyword}.jpg"`.strip
    json      = JSON.parse curl_output

    similar_images = []

    json['result'].each do |result|
      similar_images.push "http://204.15.199.173:8000/collection/?filepath=#{result['filepath']}"
    end

    {
      :google_image   => google_image,
      :similar_images => similar_images,
    }
  end

  def self.build_query(keyword)
    "http://www.google.ca/images?hl=en&q=#{keyword}&um=1&ie=UTF-8&source=og&sa=N&tab=wi"
  end
end
