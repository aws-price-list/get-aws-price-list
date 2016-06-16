require_relative '../../api/route53_price_list_api'

RSpec.describe Route53PriceListAPI do

  it 'GET product families' do
    get '/v1/AmazonRoute53/product_families'
    expect(last_response).to be_ok

    product_families = last_response.body
    expected_product_families = '["DNS Health Check","DNS Query","DNS Zone"]'
    expect(product_families).to eql(expected_product_families)
  end


  it 'GET routing types for DNS Query product family' do
    get '/v1/AmazonRoute53/product_families/DNS_Query/routing_types'
    expect(last_response).to be_ok

    routing_types = last_response.body
    expected_routing_types = '["Geo DNS","Latency Based Routing","Standard"]'
    expect(routing_types).to eq(expected_routing_types)
  end

  it "GET routing targets for 'Geo DNS' DNS Query" do
    get '/v1/AmazonRoute53/product_families/DNS_Query/routing_types/Geo_DNS/routing_targets'
    expect(last_response).to be_ok

    routing_targets = last_response.body
    expected_routing_targets = '["AWS Infrastructure","External"]'
    expect(routing_targets).to eq(expected_routing_targets)
  end

end