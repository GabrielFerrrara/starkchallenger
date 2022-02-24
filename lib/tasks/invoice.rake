namespace :invoice do
  desc "Create invoice list and send to StarkBank service"
  task create: :environment do
    require('starkbank')
    require ('cpf_faker')
    
    private_key_content = File.open('privateKey.pem')
    
    user = StarkBank::Project.new(
    environment: 'sandbox',
    id: '	6724014944813056',
    private_key: private_key_content
    )

    StarkBank.user = user

    invoices = []

    amount = rand(8..12)
    count = 0

    while count <= amount
      
    invoices << {
        
          amount: rand(1..10000),
          name: Faker::Name.name,
          tax_id: Faker::CPF.pretty, 
          due: Time.now + 24 * 3600,
          fine: rand(1..5),
          interest: rand(1.0..10.0),
          expiration: 3600,
        }
        puts invoice.tax_id
        count += 1

    end

    
    StarkBank::Invoice.new(invoices)

    

#    invoices.each do |invoice|
#    puts invoice
    


  end

end
