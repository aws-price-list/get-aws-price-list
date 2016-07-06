unless ENV["DATABASE_URL"]
  ENV["DATABASE_URL"] = "mongodb://127.0.0.1:27017/aws-price-list"
end

require_relative 'api/route53_price_list_api'

run Rack::Cascade.new [Route53PriceListAPI]
