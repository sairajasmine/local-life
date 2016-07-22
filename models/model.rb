require 'uri' # allows ruby to grab a link
require 'net/http' 
require 'json'
require 'pry'
# require 'factual'

def format_request_and_send_api_call(location, search_terms)
    loc = location.gsub(" ", "%20")
    # factual = Factual.new("FSSElqWOAa8cUlkxy3AAZUE5seh8I27fG5PtvlIs", "kv0CT3urMAh4rWHMjGJdBoJRraYd6t3LweMBe5ig")
    # factual.table("places-us").filters("$and" => [{"category_ids" => {"$includes_any" => [312, 347]}}, {"locality" => "los angeles"}]).rows
    api = "http://api.v3.factual.com/t/places?filters={%22$and%22:[{%22locality%22:%22#{location}%22,%22category_labels%22:{%22$includes%22:%22#{search_terms}%22}}]}&KEY=FSSElqWOAa8cUlkxy3AAZUE5seh8I27fG5PtvlIs"
    #  api_request = "http://api.v3.factual.com/t/[table_id]/[factual_id]?select=[field names]&q=#{search_terms}&geo=[geo_filter]&filters=[row filter]&threshold=[confident|default|comprehensive]&offset=[offset]&limit=[limit]&include_count=[true/false]&sort=[column:asc/desc|blending JSON]"
    make_api_call(api)
end

def make_api_call(request_string)
    uri = URI(request_string)
    response = Net::HTTP.get(uri)
    formatted_data = JSON.parse(response)
    p formatted_data
    data = formatted_data["response"]["data"]
    
    # addresses = []
    # data.each do |thing|
    #     addresses << thing["address"]
    # 
    

    names = {}
    data.each do |place|
        restaurant_name = place["name"]
        names[restaurant_name] ||= place["address"]
    end
    
    names
    
    # data_we_want = [names, addresses]
    # [[array of names], [array_of_addresses]]
end


# format_request_and_send_api_call("coffee", "New")