require 'birthday'

describe Birthday do

  context "#initialize"

  it "should have a day" do
    birthday = Birthday.new(13, 5)
    expect(birthday.day).to eq 13
  end

  it "should have a month" do
    birthday = Birthday.new(13, 5)
    expect(birthday.month).to eq 5
  end

  context "#valid birthday"

  it "should reject non-numerical input" do
    bad_birthday = Birthday.new("hello", "bye")
    expect(bad_birthday.valid?).to be false
  end

  it "should reject a day higher than 29 for February" do
    bad_birthday = Birthday.new(30, 2)
    expect(bad_birthday.valid?).to be false
  end

  it "should reject a day higher than 30 for months with 30 days" do
    bad_birthday = Birthday.new(31, 4)
    expect(bad_birthday.valid?).to be false
  end

  it "should reject a day higher than 31 for months with 31 days" do
    bad_birthday = Birthday.new(32, 5)
    expect(bad_birthday.valid?).to be false
  end



end