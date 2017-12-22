# Step 0 - get date you want to discover

print 'Insert day (1-31):   '
day   = gets.to_i
print 'Insert month (1-12): '
month = gets.to_i
print 'Insert year (yyyy):  '
year  = gets

# Debug
# day   = 21
# month = 6
# year  = "1926"

# Step 1 - compute the base day of century
baseDay = (((5 * (year[0, 2].to_i + 1)) + (year[0, 2].to_i / 4).ceil % 7) + 4) % 7
# puts baseDay

# Step 2 - compute doomsday of year
doomsday = (((year[2, 4].to_i / 12).ceil + (year[2, 4].to_i % 12) + ((year[2, 4].to_i % 12) / 4).ceil) % 7) + baseDay
# brief formula
doomsday = ((year[2, 4].to_i + (year[2, 4].to_i / 4).ceil) % 7) + baseDay
# puts doomsday

# Step 3 - find the day of the week
nearest = 9999999999
case month
	when 1
		if ((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0)
			nearest = 4
		else
			[3, 31].each {
				|val|
				if (day-val).abs < nearest
					nearest = val
				end
			}
		end
	when 2
		ddays = [1, 29]
		if ((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0)
			ddays = [7, 14, 21, 28]
		end
		ddays.each {
			|val|
			if (day-val).abs < nearest
				nearest = val
			end
		}
	when 3
		[7, 14, 21, 28].each {
			|val|
			if (day-val).abs < nearest
				nearest = val
			end
		}
	when 4
		nearest = 4
	when 5
		nearest = 9
	when 6
		nearest = 6
	when 7
		nearest = 11
	when 8
		nearest = 8
	when 9
		nearest = 5
	when 10
		nearest = 10
	when 11
		nearest = 7
	when 12
		nearest = 12
	else
		nearest = 9999
end

weekday = (day - nearest + doomsday) % 7
puts "~~~~~~~~~~~~~~~~~~~~~~~"
puts ['January', 'February', 'March', 
	  'April', 'May', 'June', 'July', 
	  'August', 'September', 'October', 
	  'November', 'December'][month-1]+" "+day.to_s+", "+year+" was "+['Monday', 'Tuesday', 'Wednesday', 'Thusday', 'Friday', 'Saturday', 'Sunday'][weekday-1]






