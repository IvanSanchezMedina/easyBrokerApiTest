require 'rspec'
require_relative 'easy_broker_api'

RSpec.describe EasyBrokerAPI do
  let(:auth_token) { 'l7u502p8v46ba3ppgvj5y2aad50lb9' }
  let(:api) { EasyBrokerAPI.new(auth_token) }

  describe '#fetch_properties' do
  
    it 'returns properties with titles' do
      properties = api.fetch_properties
      puts "Properties with titles:"
      properties.each do |property| 
        # iterar solo los titulos de las propiedades para mostrar en consola
        puts property['title']
      end
      expect(properties.all? { |property| property.key?('title') }).to be_truthy
    end
  end
end
