class InvoiceController < ApplicationController
  require('starkbank')
  def initialize
    private_key_content = File.read('privateKey.pem')
    user = StarkBank::Project.new(
      environment: 'sandbox',
      id: '6724014944813056',
      private_key: private_key_content
    )

    StarkBank.user = user
  end

  def hook
    if params[:event][:log][:type] == 'credited'
      transfers = StarkBank::Transfer.create(
        [
          StarkBank::Transfer.new(
            amount: params[:event][:log][:invoice][:amount],
            bank_code: '20018183',
            branch_code: '0001',
            account_number: '6341320293482496',
            tax_id: '20.018.183/0001-80',
            name: 'Stark Bank S.A.'
          )
        ]
      )
      render json: { success: true, transfers: transfers.first }
    end
  end
end
