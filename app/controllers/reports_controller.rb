class ReportsController < ApplicationController
  def index
    @cabins = []
    10.times do |n|
      @cabins << OpenStruct.new(id: n, name: ('a'..'z').to_a[n].capitalize, kids: [])
      sex = %W(M F).sample
      10.times do |k|
        @cabins.last.kids << OpenStruct.new(id: n * 10 + k , name: "Bob", sex: sex, age: (8..13).to_a.sample, grade: %W(2 3 4 5 6).sample)
      end
    end
  end
end
