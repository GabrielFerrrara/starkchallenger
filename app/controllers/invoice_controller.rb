require('starkbank')

class InvoiceController < ApplicationController
    def initialize
        private_key_content = File.open('adao_starkbank_key.pem').read
        project = StarkBank::Project.new(environment: 'sandbox',id: '6161064991391744', private_key: private_key_content)
        StarkBank.user = project
    end

    def hook
        binding.pry
    end
end