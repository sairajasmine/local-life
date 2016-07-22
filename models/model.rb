require 'uri' # allows ruby to grab a link
require 'net/http' 
require 'json'
require 'pry'
# require 'factual'

def format_request_and_send_api_call(location)
    loc = location.gsub(" ", "%20")
    # factual = Factual.new("FSSElqWOAa8cUlkxy3AAZUE5seh8I27fG5PtvlIs", "kv0CT3urMAh4rWHMjGJdBoJRraYd6t3LweMBe5ig")
    # factual.table("places-us").filters("$and" => [{"category_ids" => {"$includes_any" => [312, 347]}}, {"locality" => "los angeles"}]).rows
    api = "https://www.factual.com/data/t/places#filters={"$and":[{"country":{"$eq":"US"}}]}&q=#{location}"
    
    #  api_request = "http://api.v3.factual.com/t/[table_id]/[factual_id]?select=[field names]&q=#{search_terms}&geo=[geo_filter]&filters=[row filter]&threshold=[confident|default|comprehensive]&offset=[offset]&limit=[limit]&include_count=[true/false]&sort=[column:asc/desc|blending JSON]"
    make_api_call(api)
end

def make_api_call(request_string)
   uri = URI(request_string)
   response = Net::HTTP.get(uri)
   formatted_data = JSON.parse(response)
  p formatted_data
#   data = formatted_data["response"]["data"]
#   addresses = []
#   data.each do |thing|
#       addresses << thing["address"]
#     end
#     addresses

end

# format_request_and_send_api_call("coffee", "New")