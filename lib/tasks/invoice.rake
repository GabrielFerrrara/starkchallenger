namespace :invoice do
  desc "Create invoice list and send to StarkBank service"
  task seed: :environment do
    require('starkbank')

    private_key_content = File.open('adao_starkbank_key.pem').read
    project = StarkBank::Project.new(environment: 'sandbox',id: '6161064991391744', private_key: private_key_content)
    StarkBank.user = project
    
    invoices = []

    rand(8..12).times do
      invoices << {
        amount: rand(1..1000),
        name: Faker::Name.name,
        tax_id: Faker::IDNumber.brazilian_cpf, 
        due: Time.now + 24 * 3600,
        fine: rand(1..5),
        interest: rand(1.0..5.0),
        expiration: 3600,
      }
    end

    StarkBank::Invoice.create(invoices)
  end

end
