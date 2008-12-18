namespace :transfer do
  desc "Transfer dirty listings"
  task(:all => :environment) do
     puts Account.transfer_all.inspect
  end
end
