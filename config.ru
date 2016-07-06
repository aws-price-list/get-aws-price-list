require_relative 'api/route53_price_list_api'

run Rack::Cascade.new [Route53PriceListAPI]
