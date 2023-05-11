DateTime.current.upto(5.years.from_now) do |date_time|
  DateTime.create!(
    year: date_time.year,
    month: date_time.month,
    week: date_time.strftime('%U').to_i,
    day: date_time.day,
    hour: date_time.hour
  )
end
puts 'done'