puts 'CREATING ROLES'
Role.create!([
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "prospect", resource_id: nil, resource_type: nil},
  {name: "applicant", resource_id: nil, resource_type: nil},
  {name: "student", resource_id: nil, resource_type: nil},
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "prospect", resource_id: nil, resource_type: nil},
  {name: "applicant", resource_id: nil, resource_type: nil},
  {name: "student", resource_id: nil, resource_type: nil}
])
puts 'SETTING UP DEFAULT USER LOGIN'
admin = User.create! :email => 'admin1@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << admin.email
prospect = User.create! :email => 'prospect1@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << prospect.email
applicant = User.create! :email => 'applicant1@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << applicant.email
student = User.create! :email => 'student1@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << student.email
admin.add_role :admin
prospect.add_role :prospect
applicant.add_role :applicant
student.add_role :student
Banner.create!([
  {name: "Test", image: "banner.jpg", link: "/", active: true}
])
CreditPointPack.create!([
  {name: "Starter Pack", number_of_points: 50, price: 18000, available: true},
  {name: "Builder Pack", number_of_points: 100, price: 30000, available: true},
  {name: "Expert Pack", number_of_points: 1000, price: 295000, available: true}
])
Goal.create!([
  {name: "Web app developer", description: "You want a career as a web app developer", icon: "building", slug: "web-app-developer"},
  {name: "iPhone app developer", description: "You want to build iPhone apps", icon: "phone", slug: "iphone-app-developer"},
  {name: "Coding teacher", description: "You want to teach people to code", icon: "building", slug: "coding-teacher"},
  {name: "Tech startup entrepreneur", description: "reee", icon: "rocket", slug: "tech-startup-entrepreneur"}
])
GoalSkill.create!([
  {goal_id: 1, skill_id: 1, required_skill_level: 3},
  {goal_id: 1, skill_id: 2, required_skill_level: 3},
  {goal_id: 1, skill_id: 3, required_skill_level: 3},
  {goal_id: 1, skill_id: 4, required_skill_level: 3},
  {goal_id: 1, skill_id: 5, required_skill_level: 3},
  {goal_id: 1, skill_id: 6, required_skill_level: 3},
  {goal_id: 1, skill_id: 7, required_skill_level: 3},
  {goal_id: 1, skill_id: 8, required_skill_level: 3},
  {goal_id: 1, skill_id: 10, required_skill_level: 3},
  {goal_id: 1, skill_id: 11, required_skill_level: 3},
  {goal_id: 4, skill_id: 1, required_skill_level: 4},
  {goal_id: 4, skill_id: 4, required_skill_level: 4},
  {goal_id: 4, skill_id: 7, required_skill_level: 4},
  {goal_id: 5, skill_id: 1, required_skill_level: 1},
  {goal_id: 5, skill_id: 2, required_skill_level: 1},
  {goal_id: 5, skill_id: 3, required_skill_level: 2},
  {goal_id: 5, skill_id: 4, required_skill_level: 2},
  {goal_id: 5, skill_id: 5, required_skill_level: 1},
  {goal_id: 5, skill_id: 6, required_skill_level: 1},
  {goal_id: 5, skill_id: 7, required_skill_level: 1},
  {goal_id: 5, skill_id: 8, required_skill_level: 2},
  {goal_id: 5, skill_id: 9, required_skill_level: 2},
  {goal_id: 5, skill_id: 10, required_skill_level: 1},
  {goal_id: 5, skill_id: 11, required_skill_level: 2},
  {goal_id: 3, skill_id: 1, required_skill_level: 1},
  {goal_id: 3, skill_id: 2, required_skill_level: 2},
  {goal_id: 3, skill_id: 3, required_skill_level: 2},
  {goal_id: 3, skill_id: 5, required_skill_level: 2},
  {goal_id: 3, skill_id: 7, required_skill_level: 2},
  {goal_id: 3, skill_id: 8, required_skill_level: 2},
  {goal_id: 3, skill_id: 9, required_skill_level: 3}
])
GoalUnit.create!([
  {unit_id: 2, goal_id: 1},
  {unit_id: 1, goal_id: 1},
  {unit_id: 3, goal_id: 1},
  {unit_id: 4, goal_id: 1},
  {unit_id: 5, goal_id: 1},
  {unit_id: 6, goal_id: 1},
  {unit_id: 7, goal_id: 1},
  {unit_id: 8, goal_id: 1},
  {unit_id: 2, goal_id: 3},
  {unit_id: 1, goal_id: 3},
  {unit_id: 3, goal_id: 3},
  {unit_id: 2, goal_id: 4},
  {unit_id: 1, goal_id: 4},
  {unit_id: 3, goal_id: 4},
  {unit_id: 4, goal_id: 4},
  {unit_id: 5, goal_id: 4},
  {unit_id: 6, goal_id: 4},
  {unit_id: 7, goal_id: 4},
  {unit_id: 8, goal_id: 4},
  {unit_id: 2, goal_id: 5},
  {unit_id: 1, goal_id: 5},
  {unit_id: 3, goal_id: 5},
  {unit_id: 4, goal_id: 5},
  {unit_id: 5, goal_id: 5},
  {unit_id: 6, goal_id: 5},
  {unit_id: 7, goal_id: 5},
  {unit_id: 8, goal_id: 5}
])
Location.create!([
  {name: "Coder Factory HQ", building: "PLAY", street: "Level 1, 91 Campbell Street", suburb: "Surry Hills", state: "NSW", postcode: "2010", country: "Australia", map_link: "https://goo.gl/maps/1exbq", city: "Sydney"},
  {name: "River City Labs", building: "", street: "2/282 Wickham St", suburb: "Fortitude Valley", state: "QLD", postcode: "4006", country: "Australia", map_link: "https://goo.gl/maps/ab6W4", city: "Brisbane"}
])
Payment.create!([
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 18000, credit_points_purchased: 50, user_id: 1, payment_received: nil},
  {payment_method: "credit_card", payment_price: 295000, credit_points_purchased: 1000, user_id: 16, payment_received: nil}
])
PointsTable.create!([
  {user_id: 5, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 6, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 7, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 8, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 9, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 10, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 11, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 12, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: 13, received: nil, purchased: nil, spent: nil, current: nil},
  {user_id: nil, received: nil, purchased: nil, spent: nil, current: 0},
  {user_id: 1, received: nil, purchased: nil, spent: nil, current: 0},
  {user_id: 1, received: nil, purchased: nil, spent: nil, current: 50},
  {user_id: nil, received: nil, purchased: nil, spent: nil, current: 0},
  {user_id: 16, received: 5, purchased: 1000, spent: nil, current: 1005}
])
PointsTransaction.create!([
  {user_id: 1, transaction_type: "purchase", number_of_points: 50, value_of_points: 25000, notes: nil, approval_required: false, approval_received: nil, admin_id: nil},
  {user_id: 1, transaction_type: "purchase", number_of_points: 50, value_of_points: 25000, notes: nil, approval_required: false, approval_received: nil, admin_id: nil},
  {user_id: 1, transaction_type: "purchase", number_of_points: 50, value_of_points: 25000, notes: nil, approval_required: false, approval_received: nil, admin_id: nil},
  {user_id: 16, transaction_type: "purchase", number_of_points: 1000, value_of_points: 295000, notes: nil, approval_required: false, approval_received: nil, admin_id: nil}
])
PopularProgramme.create!([
  {name: "Beginner Coder Weekend Programme", tagline: "Learn how to build your own web application and publish it to the web.", description: "All you need to know!", total_points: 105, credit_point_pack_id: 3, slug: "beginner-coder-weekend-programme", image: "PLAY.jpg"},
  {name: "Web Application Developer Programme", tagline: "Learn all the things you need to build your own web applications using Ruby on Rails", description: "This programme teaches you application design, data structures, Ruby, the Rails framework, AJAX, gems", total_points: 600, credit_point_pack_id: 3, slug: "web-application-developer-programme", image: "PLAY.jpg"}
])
PopularProgrammeUnit.create!([
  {popular_programme_id: 1, unit_id: 2},
  {popular_programme_id: 1, unit_id: 1},
  {popular_programme_id: 1, unit_id: 3},
  {popular_programme_id: 1, unit_id: 4},
  {popular_programme_id: 2, unit_id: 2},
  {popular_programme_id: 2, unit_id: 1},
  {popular_programme_id: 2, unit_id: 3},
  {popular_programme_id: 2, unit_id: 4},
  {popular_programme_id: 2, unit_id: 5},
  {popular_programme_id: 2, unit_id: 6},
  {popular_programme_id: 3, unit_id: 9},
  {popular_programme_id: 3, unit_id: 10},
  {popular_programme_id: 3, unit_id: 11},
  {popular_programme_id: 3, unit_id: 12},
  {popular_programme_id: 3, unit_id: 13},
  {popular_programme_id: 3, unit_id: 14},
  {popular_programme_id: 3, unit_id: 7},
  {popular_programme_id: 3, unit_id: 15},
  {popular_programme_id: 3, unit_id: 16},
  {popular_programme_id: 3, unit_id: 17},
  {popular_programme_id: 3, unit_id: 18},
  {popular_programme_id: 3, unit_id: 19},
  {popular_programme_id: 3, unit_id: 20},
  {popular_programme_id: 3, unit_id: 21},
  {popular_programme_id: 3, unit_id: 22},
  {popular_programme_id: 3, unit_id: 23},
  {popular_programme_id: 3, unit_id: 24},
  {popular_programme_id: 3, unit_id: 25},
  {popular_programme_id: 3, unit_id: 28},
  {popular_programme_id: 3, unit_id: 29},
  {popular_programme_id: 3, unit_id: 31}
])
Post.create!([
  {title: "Everything you need to know about Heartbleed", lead: "Even after three weeks we are still being contacted by people about the Heartbleed bug. This is why we decided to create this comprehensive article that will leave no question unanswered.", content: "<h3>A story of heartbeats</h3>\r\n\r\n<p>About three weeks ago a major flaw in the open source SSL software created a hitherto unknown outcry not only in tech savvy but also in mainstream media. But what exactly is Heartbleed apart from being the first bug with a beautiful logo? The Coder Factory tells you everything you need to know about Heartbleed and what actions you should take.</p>\r\n<h3>What happened?</h3>\r\n\r\n<p>On March 21st Neel Mehta of Google Security discovered the vulnerability in the SSL certificate. Google then created a patch to fix the problem and applied it progressively to its services. On April the 1st the Open SSL team was notified and a patch was then applied to fix the software which in its latest version 1.0.1g. is immune for attacks trying to exploit the bug. On April the 7th most of the world found out about Heartbleed which by that time got a pretty little website run by the Finish IT security firm Codenomicon that discovered the bug separately to Mehta on April the 2nd. What followed was an intensive coverage of Heartbleed in almost every publication.</p>\r\nWhat is Heartbleed?\r\n\r\nHeartbleed is a tiny little bug in the OpenSSL TLS (Transport Layer Security) ‘heartbeat’ mechanism. TLS is a protocol that is used to secure communication between web services, by exchanging a symmetric key. The logic behind this is pretty much similar to your Bluetooth encryption. Only if you insert a specified key, your devices will connect (attention: oversimplification!!). The Heartbeat mechanism is nothing more than a periodic signal that ensures the key is valid. The bug in this mechanism is a missing bounds check that can be used to fetch data from a server. In normal use the heartbeat request sends a message with a payload, typically a text string along with the payloads length. The receiving server must then send the exact same payload back to ensure encryption. The missing bounds check allows attackers to extend the length of the request, permitting them to receive a much longer response containing the text string but also whatever 496 characters (in case of a 4 character string) happened to be in the server memory before. That could be completely useless data but it could also contain master keys, passwords, and usernames which then could be used to attain further data such as credit card information.\r\n\r\nAll this wouldn’t be worth discussing if this was an isolated bug that only appeared on your mums online shop for handmade socks. But the adoption of OpenSSL is estimated to be two thirds of the servers currently on the internet. Among the affected websites were Eventbrite, OKCupid and even the website of the FBI. The online magazine Ars Technica points out that OpenSSL is “by far the Internet’s most popular open-source cryptographic library and TLS implementation”.\r\nWhat can I do?\r\n\r\nFirst of all change your passwords! No one knows on which scale the bug has been exploited so changing your passwords is a necessary precaution all of us should take. There are various tools out there that are supposed to detect if the site is affected one of them being AppCheck by Codenomicon. If you are an administrator or webmaster you should already have applied the patch. Reissue your SSL certificates and urge users to change their passwords!\r\n", image: "http://s12.postimg.org/r8fi5wtwt/heartbleed.png", publish: "true", user_id: 1, category_id: nil, slug: ""}
])
Purchase.create!([
  {payment_id: nil, user_id: 1, guid: "8bd7fb07-b2f9-4887-a71d-cc0939cbfa64", credit_points: 50, price: 18000, credit_point_pack_id: 1, stripe_id: nil},
  {payment_id: 7, user_id: 1, guid: "d7e0e572-947e-4646-95b6-6c900b5b00e5", credit_points: 50, price: 18000, credit_point_pack_id: 1, stripe_id: "cus_42LLCju9cMCKH1"},
  {payment_id: 8, user_id: 16, guid: "ed3ed4f1-3912-4021-8d80-d650f971bed9", credit_points: 1000, price: 295000, credit_point_pack_id: 3, stripe_id: "cus_42NqwhzDXy5ezN"}
])
Skill.create!([
  {name: "Bootstrap", description: "The most popular CSS library", icon: "code", skill_group_id: 4},
  {name: "CSS", description: "Styling your HTML", icon: "code", skill_group_id: 4},
  {name: "HTML5", description: "The language of the web", icon: "code", skill_group_id: 4},
  {name: "Ruby on Rails", description: "The world's most popular web application development framework.", icon: "code", skill_group_id: 3},
  {name: "Object Oriented Programming", description: "The basics of modern programming.", icon: "code", skill_group_id: 2},
  {name: "Application security", description: "Keeping your web apps safe from malicious hackers", icon: "code", skill_group_id: 3},
  {name: "Database design", description: "How to structure your databases.", icon: "code", skill_group_id: 2},
  {name: "Data relationships", description: "How does the data in your app relate?", icon: "code", skill_group_id: 2},
  {name: "Application design", description: "Design your application before you start coding.", icon: "code", skill_group_id: 2},
  {name: "Testing", description: "Testing is an important part of producing successful apps", icon: "code", skill_group_id: 2},
  {name: "Rails debugging", description: "How to solve those errors?", icon: "code", skill_group_id: 3}
])
SkillGroup.create!([
  {name: "App development", description: "Mobile app development", icon: "mobile", slug: "app-development"},
  {name: "Career development", description: "Skills that help you start a career as a developer", icon: "code", slug: "career-development"},
  {name: "Game development", description: "Create winning games", icon: "code", slug: "game-development"},
  {name: "Web Design", description: "User interface design for the web. HTML, CSS, Javascript.", icon: "picture-o", slug: "web-design"},
  {name: "Web App Development", description: "Web application development frameworks.", icon: "laptop", slug: "web-app-development"},
  {name: "Programming Skills", description: "General programming skills", icon: "terminal", slug: "programming-skills"}
])
Unit.create!([
  {name: "Emailing from your app", tagline: "Every web app needs to be able to email users", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD62", workshop_credits: 30, online_credits: nil, active: true, slug: "emailing-from-your-app"},
  {name: "Geocode and mapping", tagline: "Putting your app on the map.", description: "", duration_minutes: 90, icon: "", skill_group_id: 3, unit_code: "WAD63", workshop_credits: 15, online_credits: nil, active: true, slug: "geocode-and-mapping"},
  {name: "HTML5 & CSS3", tagline: "Learn basic programming concepts, web design fundamentals and build professional sites with front-end frameworks.", description: "<p> The Beginner Coder programme teaches full stack web application development -- both front end (user interface design, user experience & usability, HTML, CSS and Javascript) and back end (programming concepts, software design patterns, data structures, deployment and infrastructure). </p>\r\n<p> Students will be provided with a variety of instructional strategies, as well as the tools required to learn and build apps using rapid application development methods.</p>", duration_minutes: 90, icon: "code", skill_group_id: 4, unit_code: "WD01", workshop_credits: 15, online_credits: 3, active: true, slug: "html5-css3"},
  {name: "Programming Fundamentals", tagline: "Programming basics", description: "Programming yeah!", duration_minutes: 90, icon: "code", skill_group_id: 2, unit_code: "PS01", workshop_credits: 15, online_credits: 3, active: true, slug: "programming-fundamentals"},
  {name: "Basic Bootstrap", tagline: "Make your websites and apps look amazing with Bootstrap", description: "Bootstrap!!", duration_minutes: 90, icon: "code", skill_group_id: 4, unit_code: "WD02", workshop_credits: 15, online_credits: nil, active: true, slug: "basic-bootstrap"},
  {name: "Ruby on Rails Introduction", tagline: "Programming", description: "RoR", duration_minutes: 180, icon: "code", skill_group_id: 3, unit_code: "WAD02", workshop_credits: 30, online_credits: 6, active: true, slug: "ruby-on-rails-introduction"},
  {name: "Rails Debugging", tagline: "Solving those errors", description: "Learn how to solve your own errors", duration_minutes: 90, icon: "code", skill_group_id: 3, unit_code: "WAD20", workshop_credits: 15, online_credits: nil, active: true, slug: "rails-debugging"},
  {name: "Google Maps for your app", tagline: "Integrating Google Maps", description: "Where are you?", duration_minutes: 90, icon: "code", skill_group_id: 3, unit_code: "WAD30", workshop_credits: 15, online_credits: 3, active: true, slug: "google-maps-for-your-app"},
  {name: "In-app messaging", tagline: "When you need to get in touch", description: "Allows your users to message each other", duration_minutes: 180, icon: "code", skill_group_id: 3, unit_code: "WAD31", workshop_credits: 30, online_credits: 6, active: true, slug: "in-app-messaging"},
  {name: "Project - Build your first Rails app", tagline: "Build your own web app", description: "Build your own web app", duration_minutes: 180, icon: "code", skill_group_id: 3, unit_code: "WADP01", workshop_credits: 30, online_credits: 6, active: true, slug: "project-build-your-first-rails-app"},
  {name: "Introduction to Ruby ", tagline: "Learn about the Ruby language", description: "", duration_minutes: 180, icon: "", skill_group_id: 2, unit_code: "PS30", workshop_credits: 30, online_credits: nil, active: true, slug: "introduction-to-ruby"},
  {name: "Intermediate Ruby", tagline: "Learn more complex Ruby", description: "", duration_minutes: 180, icon: "", skill_group_id: 2, unit_code: "PS31", workshop_credits: 30, online_credits: nil, active: true, slug: "intermediate-ruby"},
  {name: "Advanced HTML/CSS/Bootstrap", tagline: "Master HTML, CSS and Bootstrap", description: "Use themes too", duration_minutes: 180, icon: "", skill_group_id: 4, unit_code: "WD30", workshop_credits: 30, online_credits: nil, active: true, slug: "advanced-html-css-bootstrap"},
  {name: "Workings of the web", tagline: "How the web works", description: "", duration_minutes: 90, icon: "", skill_group_id: 3, unit_code: "WAD32", workshop_credits: 15, online_credits: nil, active: true, slug: "workings-of-the-web"},
  {name: "Anatomy of a Rails app", tagline: "Rails inside out", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD32", workshop_credits: 30, online_credits: nil, active: true, slug: "anatomy-of-a-rails-app"},
  {name: "Rails the hard way", tagline: "Learn how Rails really works", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD33", workshop_credits: 30, online_credits: nil, active: true, slug: "rails-the-hard-way"},
  {name: "Rails explored", tagline: "More indepth exploration of Rails", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD34", workshop_credits: 30, online_credits: nil, active: true, slug: "rails-explored"},
  {name: "Databases for web application", tagline: "Using databases effectively in your web application", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD35", workshop_credits: 30, online_credits: nil, active: true, slug: "databases-for-web-application"},
  {name: "Application Design", tagline: "The more planning you do, the less coding you do", description: "", duration_minutes: 180, icon: "", skill_group_id: 2, unit_code: "PS32", workshop_credits: 30, online_credits: nil, active: true, slug: "application-design"},
  {name: "Rails models", tagline: "The M of MVC in Rails", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD40", workshop_credits: 30, online_credits: nil, active: true, slug: "rails-models"},
  {name: "Rails controllers and routing", tagline: "The C in MVC", description: "The controllers of the application", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD41", workshop_credits: 30, online_credits: nil, active: true, slug: "rails-controllers-and-routing"},
  {name: "Rails Views and Rendering", tagline: "Templates, rendering partials and optimising", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD44", workshop_credits: 30, online_credits: nil, active: true, slug: "rails-views-and-rendering"},
  {name: "Using Git, Github and Bitbucket", tagline: "Source control and managing your code assets", description: "", duration_minutes: 180, icon: "", skill_group_id: 2, unit_code: "PS40", workshop_credits: 30, online_credits: nil, active: true, slug: "using-git-github-and-bitbucket"},
  {name: "Deploying your app to the web", tagline: "How to get your app up on the web", description: "", duration_minutes: 90, icon: "", skill_group_id: 3, unit_code: "WAD50", workshop_credits: 15, online_credits: nil, active: true, slug: "deploying-your-app-to-the-web"},
  {name: "Authentication & Authorisation", tagline: "Securing your app, registering users and role based permissions", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD60", workshop_credits: 30, online_credits: nil, active: true, slug: "authentication-authorisation"},
  {name: "Essential Gems 1", tagline: "Learn about all these great gems.", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD70", workshop_credits: 30, online_credits: nil, active: true, slug: "essential-gems-1"},
  {name: "Essential Gems 2", tagline: "Learn about even more great gems.", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD61", workshop_credits: 30, online_credits: nil, active: true, slug: "essential-gems-2"},
  {name: "Making your app social", tagline: "Self-referential relationships", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD71", workshop_credits: 30, online_credits: nil, active: true, slug: "making-your-app-social"},
  {name: "AJAX in Rails", tagline: "Make your app more interactive and engaging with AJAX", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD73", workshop_credits: 30, online_credits: nil, active: true, slug: "ajax-in-rails"},
  {name: "SEO and web optimisation", tagline: "All you need to know to have you app found on the web", description: "", duration_minutes: 180, icon: "", skill_group_id: 3, unit_code: "WAD81", workshop_credits: 30, online_credits: nil, active: true, slug: "seo-and-web-optimisation"}
])
UnitSession.create!([
  {unit_id: 2, day: "Monday", date: "2014-05-24", start_time: "2000-01-01 19:30:00", end_time: "2000-01-01 21:00:00", number_of_places: 12, number_of_students_registered: nil, location_id: 1},
  {unit_id: 1, day: "Monday", date: "2014-05-29", start_time: "2000-01-01 18:00:00", end_time: "2000-01-01 19:30:00", number_of_places: 12, number_of_students_registered: nil, location_id: 1},
  {unit_id: 4, day: "Tuesday", date: "2014-05-25", start_time: "2000-01-01 19:30:00", end_time: "2000-01-01 21:00:00", number_of_places: 12, number_of_students_registered: nil, location_id: 1},
  {unit_id: 3, day: "Tuesday", date: "2014-05-25", start_time: "2000-01-01 18:00:00", end_time: "2000-01-01 19:30:00", number_of_places: 12, number_of_students_registered: nil, location_id: 1},
  {unit_id: 2, day: "Friday", date: "2014-05-30", start_time: "2000-01-01 18:00:00", end_time: "2000-01-01 21:00:00", number_of_places: 12, number_of_students_registered: nil, location_id: 1},
  {unit_id: 1, day: "Sunday", date: "2014-05-25", start_time: "2000-01-01 18:00:00", end_time: "2000-01-01 21:00:00", number_of_places: 12, number_of_students_registered: nil, location_id: 2}
])
UnitSkill.create!([
  {unit_id: 2, skill_id: 5, before_skill_level: 0, after_skill_level: 1},
  {unit_id: 1, skill_id: 2, before_skill_level: 0, after_skill_level: 1},
  {unit_id: 1, skill_id: 3, before_skill_level: 0, after_skill_level: 1},
  {unit_id: 4, skill_id: 4, before_skill_level: 0, after_skill_level: 1},
  {unit_id: 5, skill_id: 11, before_skill_level: 1, after_skill_level: 2},
  {unit_id: 6, skill_id: 8, before_skill_level: 1, after_skill_level: 2},
  {unit_id: 6, skill_id: 9, before_skill_level: 1, after_skill_level: 2},
  {unit_id: 6, skill_id: 11, before_skill_level: 0, after_skill_level: 1},
  {unit_id: 7, skill_id: 4, before_skill_level: 1, after_skill_level: 2},
  {unit_id: 8, skill_id: 4, before_skill_level: 2, after_skill_level: 3},
  {unit_id: 8, skill_id: 8, before_skill_level: 1, after_skill_level: 2},
  {unit_id: 3, skill_id: 1, before_skill_level: 0, after_skill_level: 1}
])
WeekendProgramme.create!([
  {popular_programme_id: 2, location_id: 1, day: "Saturday + Sunday", date: "2014-06-07", start_time: "2000-01-01 10:00:00", end_time: "2000-01-01 16:00:00", number_of_places: 12, number_of_students_registered: nil, end_date: "2014-06-08"},
  {popular_programme_id: 2, location_id: 2, day: "Saturday + Sunday", date: "2014-05-17", start_time: "2000-01-01 10:00:00", end_time: "2000-01-01 16:00:00", number_of_places: 3, number_of_students_registered: nil, end_date: "2014-05-18"},
  {popular_programme_id: 3, location_id: 1, day: "Saturday", date: "2014-05-31", start_time: "2000-01-01 10:00:00", end_time: "2000-01-01 16:00:00", number_of_places: 12, number_of_students_registered: nil, end_date: "2014-07-22"}
])
