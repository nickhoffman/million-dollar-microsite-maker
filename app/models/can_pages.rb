class CanPages
  def self.search(options)
    require 'net/http'
    require 'nokogiri'

    query       = build_query options
    puts "search> query = [#{query.inspect}]"
    puts
    response    = Net::HTTP.get_response URI.parse query
    xml         = Nokogiri::XML response.body
    @companies  = []

    xml.xpath('/ResultSet/Result').map do |xml_result|
      attributes = {}
#     puts "xml_result = [#{xml_result}]"
#     puts
#     puts "num children = [#{xml_result.children.count}]"
#     puts "---------"

#     puts "children = [#{xml_result.children}]"
      xml_result.children.map do |xml_result_attribute|
        puts "  --------------"
        puts "  xml_result_attribute = [#{xml_result_attribute}]"
        puts

        attribute = xml_result_attribute.name.squish
        value     = xml_result_attribute.text.squish
#       puts "  attribute = [#{attribute.inspect}]"
#       puts "  value     = [#{value.inspect}]"

        unless value.blank?
#         puts "    xml  = #{xml_result_attribute}"
#         puts "    attribute  = #{attribute.inspect}"
#         puts "    value      = #{value.inspect}"

          attributes[attribute.to_sym] = value
        end
      end

#     puts
#     puts "attributes = [#{attributes.inspect}]"
      @companies.push Company.new attributes
    end

    @companies
  end

  def self.build_query(options)
    require 'uri'

    params = options.to_a.map {|a| "#{a[0]}=#{URI.escape a[1]}"}.join '&'
    "#{CANPAGES['protocol']}://#{CANPAGES['host']}/#{CANPAGES['path']}?apiKey=#{CANPAGES['API_key']}&#{params}"
  end
end
