class Statement
  def initialize(customer)
    @customer = customer
  end

  def generate
  "Statement for #{@customer.name}"
  end
end

describe Statement do

  it "uses the customer's name in the header (with a stub)" do
    customer = stub('customer', :name => 'Arkid')
    statement = Statement.new(customer)
    statement.header.should == "Statement for Arkid"
  end


  it "uses the customer's name in the header (with a mock)" do
    customer = mock('customer')
    customer.should_receive(:name).and_return('Arkid')
    statement = Statement.new(customer)
    statement.header.should == "Statement for Arkid"
  end
end
