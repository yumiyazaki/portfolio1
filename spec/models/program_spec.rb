require 'rails_helper'

RSpec.describe Program, type: :model do

  it "タイトル, 放送局, 曜日, 放送時間がある場合,有効"  do
    program = Program.new(
      title: "かくしごと",
      broadcaster: "TOKYO MX",
      wday: "木曜",
      airtime: "24:00"
    )
    expect(program).to be_valid
  end

  it "タイトルがない場合,無効" do
    program = Program.new(
      title: nil,
      broadcaster: "TOKYO MX",
      wday: "木曜",
      airtime: "24:00"
    )
    program.valid?
    expect(program.errors[:title]).to include("can't be blank")
  end

  it "放送局がない場合,無効" do
    program = Program.new(
      title: "かくしごと",
      broadcaster: nil,
      wday: "木曜",
      airtime: "24:00"
    )
    program.valid?
    expect(program.errors[:broadcaster]).to include("can't be blank")
  end

  it "曜日がない場合,無効" do
    program = Program.new(
      title: "かくしごと",
      broadcaster: "TOKYO MX",
      wday: nil,
      airtime: "24:00"
    )
    program.valid?
    expect(program.errors[:wday]).to include("can't be blank")
  end
  it "放送時間がない場合,無効" do
    program = Program.new(
      title: "かくしごと",
      broadcaster: "TOKYO MX",
      wday: "木曜",
      airtime: nil
    )
    program.valid?
    expect(program.errors[:airtime]).to include("can't be blank")
  end
end
