class WalletsController < ApplicationController
  def show
    @wallet = Wallet.find(params[:id])
    @user = User.find(params[:user_id])

    @response = JSON.parse(open('https://fierce-oasis-50675.herokuapp.com/blockchain').read)['chain']
    @balance = 0
    @response.each do |block|
      block["transactions"].each do |transaction|
        if transaction["fromAddress"] == @wallet.public_key
          @balance -= transaction["amount"]
        elsif transaction["toAddress"] == @wallet.public_key
          @balance += transaction["amount"]
        end
      end
    end
  end
end
