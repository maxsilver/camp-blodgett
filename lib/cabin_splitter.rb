class CabinSplitter

  attr_reader :number_of_cabins, :boys, :girls

  def initialize(number_of_cabins, boys, girls)
    @number_of_cabins = number_of_cabins
    @boys             = boys
    @girls            = girls
  end

  def split
    number_of_boys  = boys.count
    number_of_girls = girls.count
    total_kids      = (number_of_boys + number_of_girls).to_f
    
    return [] if total_kids.zero?

    percent_boys    = number_of_boys / total_kids
    percent_girls   = number_of_girls / total_kids
    
    # we divide the cabins according to boy/girl percent, then to_i
    # so we don't get partial cabins

    number_of_boy_cabins  = (percent_boys * number_of_cabins).to_i
    number_of_girl_cabins = (percent_girls * number_of_cabins).to_i
    
    # we might have a forgotten cabin now, because to_i only trims
    # so we need to catch the forgotten cabin and give it to
    # the boys or the girls, depending on who has less cabins
    if number_of_cabins > number_of_boy_cabins + number_of_girl_cabins
      if number_of_boy_cabins > number_of_girl_cabins
        number_of_girl_cabins += 1
      else
        number_of_boy_cabins += 1
      end
    end

    final_boy_cabins  = assign_kids_to_cabin(boys, number_of_boys, number_of_boy_cabins)
    final_girl_cabins = assign_kids_to_cabin(girls, number_of_girls, number_of_girl_cabins)

    final_boy_cabins.concat(final_girl_cabins)
  end

  # gets a minimum number of boys per cabin, and the number of boys left over afterwards
  # iterates through cabins, assigning minimum number of boys to each, then one boy
  # as long as there are extra boys
  def assign_kids_to_cabin(kids, number_of_kids, number_of_cabins)
    cabins = []

    number_of_cabins.times do 
      cabins << []
    end
    
    number_of_extra_kids             = number_of_kids % cabins.length
    minimum_number_of_kids_per_cabin = (number_of_kids - number_of_extra_kids) / number_of_cabins
    
    array_of_kids = kids.to_a

    cabins.each do |cabin|
      minimum_number_of_kids_per_cabin.times { cabin << array_of_kids.pop }
      
      unless number_of_extra_kids == 0
        cabin << array_of_kids.pop
      end
    end

    cabins
  end
end