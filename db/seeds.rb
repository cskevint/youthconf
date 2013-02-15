# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Conference.delete_all
conferences = YAML.load_file(File.dirname(__FILE__) + '/fixtures/conferences.yml')
conferences.each do |c|
  Conference.create(
      name: c[:city],
      city: c[:city],
      state_province: c[:state_province],
      country: c[:country],
      formatted: c[:formatted],
      google: c[:google],
      lat: c[:lat],
      lng: c[:lng]
  )
end

User.delete_all
User.create(
    email:'cskevint@gmail.com',
    password:'bahai1844',
    password_confirmation:'bahai1844',
    name:'Kevin Trotter',
    date_of_birth: Date.parse('1983-12-22'),
    role:'admin'
)
User.create(
    email:'oliver.oxenham@gmail.com',
    password:'bahai1844',
    password_confirmation:'bahai1844',
    name:'Oliver Oxenham',
    date_of_birth:Date.parse('1981-05-12'),
    role:'admin'
)