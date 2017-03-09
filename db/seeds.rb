# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'
Company.create(name: "UPM")
csv_text = File.read(Rails.root.join('lib', 'seeds', 'pmdata.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }

csv.each do |row|
  t = Property.new
  t.lol = row['lol']
  t.name = row['name']
  t.unit = row['unit']
  t.unit_type = row['unit_type']
  t.bedroom = row['bedroom']
  t.group = row['group']
  t.tenantid = row['tenantid']
  t.resident_name = row['resident_name']
  t.resident_rent = row['resident_rent']
  t.unit_rent = row['unit_rent']
  t.discount = row['discount']
  t.status = row['status']
  t.days_vacant = row['days_vacant']
  t.move_in = row['move_in'] ? Date.strptime(row['move_in'], '%m/%d/%y') : nil
  t.move_out = row['move_out'] ? Date.strptime(row['move_out'], '%m/%d/%y') : nil
  t.lease_from = row['lease_from'] ? Date.strptime(row['lease_from'], '%m/%d/%y') : nil
  t.lease_to = row['lease_to'] ? Date.strptime(row['lease_to'], '%m/%d/%y') : nil
  t.amenities = row['amenities']
  t.company_id = row['company_id']
  t.save!
end
