# see if "Spot" is present

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.any?('Spot')
p ages.include?('Spot')
p ages.value?('Spot')
p ages.member?('Spot')
p ages.key?('Spot')