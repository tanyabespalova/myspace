require 'open-uri'
require 'nokogiri'
require 'csv'

class FruitService

  def initialize
    @fruits = []
  end

  def load!
    @fruits = []

    page = open("http://192.168.10.61:8080")

    doc = Nokogiri::HTML(page)

    doc.xpath("//table//tbody/tr").each do |element|
      name = element.xpath("./td[1]").text
      quantity = element.xpath("./td[2]").text.to_i
      price = element.xpath("./td[3]").text.tr('$', '').to_f
      @fruits << Fruit.new(name: name, quantity: quantity, price: price)
    end
  end

  def sort_by_title
    @fruits.sort_by{ |n| n.name}
  end

  def to_csv
    CSV.generate do |csv|
      csv << %w(Name Quantity Price Discount)

      @fruits.each do |fruit|
        csv << [fruit.name, fruit.quantity, fruit.price, fruit.discount.round(2)]
      end
    end
  end
end