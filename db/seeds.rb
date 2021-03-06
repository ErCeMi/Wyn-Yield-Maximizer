# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'
# require 'open-uri'
# Company.create(name: "UPM")
# Company.create(name: "Rosenthal & Associates")
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'pmdata.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }
#
# csv.each do |row|
#   t = Property.new
#   t.lol = row['lol']
#   t.name = row['name']
#   t.unit = row['unit']
#   t.unit_type = row['unit_type']
#   t.bedroom = row['bedroom']
#   t.group = row['group']
#   t.tenantid = row['tenantid']
#   t.resident_name = row['resident_name']
#   t.resident_rent = row['resident_rent']
#   t.unit_rent = row['unit_rent']
#   t.discount = row['discount']
#   t.status = row['status']
#   t.days_vacant = row['days_vacant']
#   t.move_in = row['move_in'] ? Date.strptime(row['move_in'], '%m/%d/%y') : nil
#   t.move_out = row['move_out'] ? Date.strptime(row['move_out'], '%m/%d/%y') : nil
#   t.lease_from = row['lease_from'] ? Date.strptime(row['lease_from'], '%m/%d/%y') : nil
#   t.lease_to = row['lease_to'] ? Date.strptime(row['lease_to'], '%m/%d/%y') : nil
#   t.amenities = row['amenities']
#   t.company_id = row['company_id']
#   t.save!
# end

require 'csv'
require 'open-uri'

Company.create(name: "UPM")
Employee.create(name: "Ricardo Cuevas", email: "rcuevas@unitedpropertymgt.com", password: "123", admin: 1, company_id: 1)

csv_text1 = File.read(Rails.root.join('lib', 'seeds', 'PropName.csv'))
csv1 = CSV.parse(csv_text1, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }

csv1.each do |row|
  t = PropertyName.new
  t.lol1 = row['lol1']
  t.name = row['name']
  t.lease_terms = row['lease_terms']
  t.save!
end







# Company.create(name: "UPM")
csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'specials.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }

csv2.each do |row|
  t = UnitType.new
  t.lol2 = row['lol2']
  t.unit_type = row['unit_type']
  t.bedroom = row['bedroom']
  t.amount_off= row['amount_off']
  t.percentage_off = row['percentage_off']
  t.growth_rate = row['growth_rate']
  t.increase_amount = row['increase_amount']
  t.market_rate_date = row['market_rate_date'] ? Date.strptime(row['market_rate_date'], '%m/%d/%y') : nil
  t.property_name_id = row['property_name_id']
  t.save!
end






csv_text3 = File.read(Rails.root.join('lib', 'seeds', 'units.csv'))
csv3 = CSV.parse(csv_text3, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }

csv3.each do |row|
  t = Property.new
  t.lol3 = row['lol3']
  t.unit = row['unit']
  t.group = row['group']
  t.tenantid = row['tenantid']
  t.resident_name = row['resident_name']
  t.resident_rent = row['resident_rent']
  t.unit_rent = row['unit_rent']
  t.status = row['status']
  t.days_vacant = row['days_vacant']
  t.move_out = row['move_out'] ? Date.strptime(row['move_out'], '%m/%d/%y') : DateTime.now
  t.lease_to = row['lease_to'] ? Date.strptime(row['lease_to'], '%m/%d/%y') : nil
  t.amenities = row['amenities']
  t.amenities_amount = row['amenities_amount']
  t.discounts = row['discounts']
  t.company_id = row['company_id']
  t.unit_type_id = row['unit_type_id']
  t.save!
end
