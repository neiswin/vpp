# определяем дату, с которой начинается заполнение таблицы
start_date = Date.today

# определяем дату, на которую нужно заполнить таблицу
end_date = start_date + 5.years

# перебираем все даты в интервале от начальной до конечной
(start_date..end_date).each do |date|
  # перебираем все часы от 0 до 23 для данной даты
  (0..23).each do |hour|
    # создаем новую запись в таблице с данными для данной даты и часа
    DateDictonary.create(
      year: date.year,
      month: date.month,
      week: date.strftime('%U').to_i,
      day: date.day,
      hour: hour
    )
  end
end

puts 'done'
