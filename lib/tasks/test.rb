require ('cpf_faker')
require ('faker')

amount = rand(8..12)
count = 0
invoices = []

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
        count += 1

      puts invoices[:tax_id]

end