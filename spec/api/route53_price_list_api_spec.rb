require_relative '../../api/route53_price_list_api'

RSpec.describe Route53PriceListAPI do

  it 'GET product families' do
    get '/v1/AmazonRoute53/product_families'
    expect(last_response).to be_ok

    product_families = last_response.body
    expected_product_families = '["DNS Health Check","DNS Query","DNS Zone"]'
    expect(product_families).to eql(expected_product_families)
  end

end