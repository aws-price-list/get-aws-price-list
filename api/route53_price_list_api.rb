require 'sinatra'
require 'sinatra/json'

require_relative '../lib/read_route53_price_list'

class Route53PriceListAPI < Sinatra::Base

  db_url = ENV["DATABASE_URL"]
  raise "Database configuration not supplied as environment variable DATABASE_URL" unless db_url

  read_route53_price_list = ReadRoute53PriceList.new(db_url)

  get '/v1/healthcheck' do
    json "OK"
  end

  get '/v1/AmazonRoute53/product_families' do
    json read_route53_price_list.get_product_families
  end

  get '/v1/AmazonRoute53/product_families/DNS_Query/routing_types' do
    json read_route53_price_list.get_routing_types
  end

  get '/v1/AmazonRoute53/product_families/DNS_Query/routing_types/Geo_DNS/routing_targets' do
    json read_route53_price_list.get_Geo_DNS_routing_targets
  end

end