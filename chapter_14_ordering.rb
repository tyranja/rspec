class Roster
  def initialize(id,database)
    @id = id
    @database = database
  end

  def register(student)
    @database.count('Roster', :course_id => @id)
    @database.add(student)
  end
end

describe Roster do
  it "asks database for count before adding" do
    database = double()
    student = double()
    database.should_receive(:count).with('Roster', :course_id => 37).ordered
    database.should_receive(:add).with(student).ordered
    
    roster = Roster.new(37, database)
    roster.register(student)
  end
end
