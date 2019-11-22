User.destroy_all
Category.destroy_all
Listing.destroy_all
Application.destroy_all

user1 = User.create(
  username: 'drumMan85',
  password: ENV['SEED_PASSWORD_1'],
  first_name: 'Dan',
  last_name: 'Romans',
  city: 'Brooklyn',
  state: 'New York',
  zip_code: '11385',
  principal_role: 'Performer',
  principal_instrument: 'Drum set',
  image_url: 'http://danromans.com/files/2018/02/drx-press-photo-2016.jpg',
  bio: 'I am a killer drummer. So good that I can\'t make any money.',
  credits: 'You wouldn\'t know them.',
  website_url: 'http://danromans.com/'
)

user2 = User.create(
  username: 'ryGuy86',
  password: ENV['SEED_PASSWORD_2'],
  first_name: 'Ryan',
  last_name: 'Hare',
  city: 'Boston',
  state: 'Massachusetts',
  zip_code: '02176',
  principal_role: 'Performer',
  principal_instrument: 'Guitar',
  image_url: 'https://pbs.twimg.com/profile_images/77225763/3250105665_43584da41f_b.jpg',
  bio: 'I am a killer guitarist. So good that I don\'t need any money.',
  credits: 'I was almost in Home Alone.',
  website_url: 'https://www.eqguitarrepair.com/index.php/about'
)

user3 = User.create(
  username: 'stanley8686',
  password: ENV['SEED_PASSWORD_3'],
  first_name: 'Dan',
  last_name: 'Stevens',
  city: 'Kingston',
  state: 'New York',
  zip_code: '12402',
  principal_role: 'Performer',
  principal_instrument: 'Bass',
  image_url: 'https://img.youtube.com/vi/CGGQBD4SYRA/0.jpg',
  bio: 'I am a killer bassist. Large mouth bass.',
  credits: 'John Stevens Hippy Experience.',
  website_url: 'https://www.reverbnation.com/artist/video/2271745'
)

one_off = Category.create(name: 'One-off Gig')
remote = Category.create(name: 'Remote Collaboration')
tour = Category.create(name: 'Tour')
song = Category.create(name: 'Songwriting')
comp = Category.create(name: 'Composition')
record = Category.create(name: 'Recording')
lyric = Category.create(name: 'Lyric Writing')
band = Category.create(name: 'Bandmate')

listing1 = Listing.create(
  subject: 'Need a drummer for my sweet band.',
  description: 'Can you come kill it on the kit for my sweet NIN tribute band?',
  date: nil,
  end_date: nil,
  city: 'Boston',
  state: 'Massachusetts',
  zip_code: '02176',
  paying: false,
  user_id: user2.id,
  category_id: band.id
)

listing2 = Listing.create(
  subject: 'Need a guitarist for my world tour.',
  description: 'Touring the world with my sweet Weird Al tribute band. You in?',
  date: 'DEC 31 2019',
  end_date: 'SEPT 1 2020',
  city: nil,
  state: nil,
  zip_code: nil,
  paying: true,
  user_id: user1.id,
  category_id: tour.id
)

listing3 = Listing.create(
  subject: 'Need a bassist for birthday gig.',
  description: 'Happy birthday to me',
  date: 'DEC 31 2019',
  end_date: nil,
  city: 'Ridgewood',
  state: 'New York',
  zip_code: '11385',
  paying: false,
  user_id: user1.id,
  category_id: one_off.id
)

app1 = Application.create(applicant_id: user1.id, listing_id: listing1.id)

app2 = Application.create(applicant_id: user2.id, listing_id: listing2.id)

app3 = Application.create(applicant_id: user2.id, listing_id: listing3.id)

app4 = Application.create(applicant_id: user3.id, listing_id: listing3.id)

puts 'SEEDED 🌱'
