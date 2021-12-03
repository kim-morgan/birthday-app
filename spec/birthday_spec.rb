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

  context "#check if today is birthday"

  it "should be able to check if today is the user's birthday" do
    today_birthday = Birthday.new(Time.now.day, Time.now.month)
    expect(today_birthday.birthday?).to be true
  end

  it "should not return true if it is not the user's birthday" do
    not_today_birthday = Birthday.new(Time.now.day + 1, Time.now.month + 2)
    expect(not_today_birthday.birthday?).to be false
  end


end