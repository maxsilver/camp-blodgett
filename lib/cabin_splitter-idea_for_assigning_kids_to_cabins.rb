number_of_cabins = 10

# ignoring sessions and stuff, assuming we're dealing with kids from single session
boys = Kid.where(sex: 'male')
girls = Kid.where(sex: 'female')


# set up some numbers
number_of_boys = boys.count
number_of_girls = girls.count

total_kids = (number_of_boys + number_of_girls).to_f # .to_f so we can do math

percent_boys = number_of_boys / total_kids
percent_girls = number_of_girls / total_kids


# we divide the cabins according to boy/girl percent, then to_i
# so we don't get partial cabins

number_of_boy_cabins = (percent_boys * number_of_cabins).to_i
number_of_girl_cabins = (percent_girls * number_of_cabins).to_i


# we might have a forgotten cabin now, because to_i only trims
# so we need to catch the forgotten cabin and give it to
# the boys or the girls, depending on who has less cabins

forgotten_cabin = true if number_of_cabins > number_of_boy_cabins + number_of_girl_cabins

if forgotten_cabin
  if number_of_boy_cabins > number_of_girl_cabins
    number_of_girl_cabins += 1
  else
    number_of_boy_cabins += 1
  end
end


# methods to assign boys to boy cabins and girls to girl cabins

def assign_boys_to_cabin(number_of_boys, number_of_boy_cabins)
  # gets a minimum number of boys per cabin, and the number of boys left over afterwards
  # iterates through cabins, assigning minimum number of boys to each, then one boy
  # as long as there are extra boys

  boy_cabins = []; number_of_boy_cabins.times { boy_cabins << kids: [] }
  array_of_boys = boys.to_a

  number_of_extra_boys = number_of_boys % boy_cabins
  minimum_number_of_boys_per_cabin = (number_of_boys - extra_boys) / number_of_boy_cabins

  boy_cabins.each do |cabin|
    minimum_number_of_boys_per_cabin.times { cabin[:kids] << array_of_boys.pop }
    unless number_of_extra_boys == 0
      cabin[:kids] << array_of_boys.pop
    end
  end
  return boy_cabins
end

def assign_girls_to_cabin(number_of_girls, number_of_girl_cabins)
  girl_cabins = []; number_of_girl_cabins.times { girl_cabins << kids: [] }
  array_of_girls = girls.to_a

  number_of_extra_girls = number_of_girls % girl_cabins
  minimum_number_of_girls_per_cabin = (number_of_girls - extra_girls) / number_of_girl_cabins

  girl_cabins.each do |cabin|
    minimum_number_of_girls_per_cabin.times { cabin[:kids] << array_of_girls.pop }
    unless number_of_extra_girls == 0
      cabin[:kids] << array_of_girls.pop
    end
  end
  return girl_cabins
end


# do it

boy_cabins = assign_boys_to_cabin(number_of_boys, number_of_boy_cabins)
girl_cabins = assign_girls_to_cabin(number_of_girls, number_of_girl_cabins)

cabins = boy_cabins.concat girl_cabins

