require 'mongo'

class ReadRoute53PriceList

  def initialize(db_url)
    @client = Mongo::Client.new(db_url)
  end

  def get_product_families
    @client[:skus].distinct("productFamily").sort
  end

  def get_routing_types
    @client[:skus].find(:productFamily => "DNS Query").distinct("attributes.routingType").sort
  end

end