puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'prospect' },
  { :name => 'applicant' },
  { :name => 'student' }
])
puts 'SETTING UP DEFAULT USER LOGIN'
admin = User.create! :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << admin.email
prospect = User.create! :email => 'prospect@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << prospect.email
applicant = User.create! :email => 'applicant@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << applicant.email
student = User.create! :email => 'student@example.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << student.email
admin.add_role :admin
prospect.add_role :prospect
applicant.add_role :applicant
student.add_role :student
CreditPointPack.create!([
  {name: "Starter Pack", number_of_points: 50, price: 18000, available: true},
  {name: "Builder Pack", number_of_points: 100, price: 30000, available: true},
  {name: "Expert Pack", number_of_points: 1000, price: 295000, available: true}
])
Goal.create!([
  {name: "Web app developer", description: "You want a career as a web app developer", icon: "building"},
  {name: "iPhone app developer", description: "You want to build iPhone apps", icon: "phone"},
  {name: "Coding teacher", description: "You want to teach people to code", icon: "building"},
  {name: "Tech startup entrepreneur", description: "reee", icon: "rocket"}
])
GoalSkill.create!([
  {goal_id: 1, skill_id: 1, required_level: 3},
  {goal_id: 1, skill_id: 2, required_level: 3},
  {goal_id: 1, skill_id: 3, required_level: 3},
  {goal_id: 1, skill_id: 4, required_level: 3},
  {goal_id: 1, skill_id: 5, required_level: 3},
  {goal_id: 1, skill_id: 6, required_level: 3},
  {goal_id: 1, skill_id: 7, required_level: 3},
  {goal_id: 1, skill_id: 8, required_level: 3},
  {goal_id: 1, skill_id: 10, required_level: 3},
  {goal_id: 1, skill_id: 11, required_level: 3},
  {goal_id: 4, skill_id: 1, required_level: 4},
  {goal_id: 4, skill_id: 4, required_level: 4},
  {goal_id: 4, skill_id: 7, required_level: 4},
  {goal_id: 5, skill_id: 1, required_level: 1},
  {goal_id: 5, skill_id: 2, required_level: 1},
  {goal_id: 5, skill_id: 3, required_level: 2},
  {goal_id: 5, skill_id: 4, required_level: 2},
  {goal_id: 5, skill_id: 5, required_level: 1},
  {goal_id: 5, skill_id: 6, required_level: 1},
  {goal_id: 5, skill_id: 7, required_level: 1},
  {goal_id: 5, skill_id: 8, required_level: 2},
  {goal_id: 5, skill_id: 9, required_level: 2},
  {goal_id: 5, skill_id: 10, required_level: 1},
  {goal_id: 5, skill_id: 11, required_level: 2},
  {goal_id: 3, skill_id: 1, required_level: 1},
  {goal_id: 3, skill_id: 2, required_level: 2},
  {goal_id: 3, skill_id: 3, required_level: 2},
  {goal_id: 3, skill_id: 5, required_level: 2},
  {goal_id: 3, skill_id: 7, required_level: 2},
  {goal_id: 3, skill_id: 8, required_level: 2},
  {goal_id: 3, skill_id: 9, required_level: 3}
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
Post.create!([
  {title: "Everything you need to know about Heartbleed", lead: "Even after three weeks we are still being contacted by people about the Heartbleed bug. This is why we decided to create this comprehensive article that will leave no question unanswered.", content: "<h3>A story of heartbeats</h3>\r\n\r\n<p>About three weeks ago a major flaw in the open source SSL software created a hitherto unknown outcry not only in tech savvy but also in mainstream media. But what exactly is Heartbleed apart from being the first bug with a beautiful logo? The Coder Factory tells you everything you need to know about Heartbleed and what actions you should take.</p>\r\n<h3>What happened?</h3>\r\n\r\n<p>On March 21st Neel Mehta of Google Security discovered the vulnerability in the SSL certificate. Google then created a patch to fix the problem and applied it progressively to its services. On April the 1st the Open SSL team was notified and a patch was then applied to fix the software which in its latest version 1.0.1g. is immune for attacks trying to exploit the bug. On April the 7th most of the world found out about Heartbleed which by that time got a pretty little website run by the Finish IT security firm Codenomicon that discovered the bug separately to Mehta on April the 2nd. What followed was an intensive coverage of Heartbleed in almost every publication.</p>\r\nWhat is Heartbleed?\r\n\r\nHeartbleed is a tiny little bug in the OpenSSL TLS (Transport Layer Security) ‘heartbeat’ mechanism. TLS is a protocol that is used to secure communication between web services, by exchanging a symmetric key. The logic behind this is pretty much similar to your Bluetooth encryption. Only if you insert a specified key, your devices will connect (attention: oversimplification!!). The Heartbeat mechanism is nothing more than a periodic signal that ensures the key is valid. The bug in this mechanism is a missing bounds check that can be used to fetch data from a server. In normal use the heartbeat request sends a message with a payload, typically a text string along with the payloads length. The receiving server must then send the exact same payload back to ensure encryption. The missing bounds check allows attackers to extend the length of the request, permitting them to receive a much longer response containing the text string but also whatever 496 characters (in case of a 4 character string) happened to be in the server memory before. That could be completely useless data but it could also contain master keys, passwords, and usernames which then could be used to attain further data such as credit card information.\r\n\r\nAll this wouldn’t be worth discussing if this was an isolated bug that only appeared on your mums online shop for handmade socks. But the adoption of OpenSSL is estimated to be two thirds of the servers currently on the internet. Among the affected websites were Eventbrite, OKCupid and even the website of the FBI. The online magazine Ars Technica points out that OpenSSL is “by far the Internet’s most popular open-source cryptographic library and TLS implementation”.\r\nWhat can I do?\r\n\r\nFirst of all change your passwords! No one knows on which scale the bug has been exploited so changing your passwords is a necessary precaution all of us should take. There are various tools out there that are supposed to detect if the site is affected one of them being AppCheck by Codenomicon. If you are an administrator or webmaster you should already have applied the patch. Reissue your SSL certificates and urge users to change their passwords!\r\n", image: "http://s12.postimg.org/r8fi5wtwt/heartbleed.png", publish: "true", user_id: 1, category_id: nil, slug: ""}
])
Profile.create!([
  {name: "oliver", phone: nil, profile_picture: nil, user_id: 5, slug: "oliver"},
  {name: "Heeeee", phone: nil, profile_picture: nil, user_id: 6, slug: "heeeee"},
  {name: "Dan", phone: nil, profile_picture: nil, user_id: 7, slug: "dan"},
  {name: "Pedro3", phone: nil, profile_picture: nil, user_id: 8, slug: "pedro3"}
])
Role.create!([
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "prospect", resource_id: nil, resource_type: nil},
  {name: "applicant", resource_id: nil, resource_type: nil},
  {name: "student", resource_id: nil, resource_type: nil}
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
  {name: "App development", description: "Mobile app development", icon: "mobile"},
  {name: "Programming Skills", description: "General programming skills", icon: "code"},
  {name: "Web App Development", description: "Web application development frameworks.", icon: "code"},
  {name: "Web Design", description: "User interface design for the web. HTML, CSS, Javascript.", icon: "code"},
  {name: "Career development", description: "Skills that help you start a career as a developer", icon: "code"},
  {name: "Game development", description: "Create winning games", icon: "code"}
])
Unit.create!([
  {name: "Programming Fundamentals", tagline: "Programming basics", description: "Programming yeah!", duration_minutes: 90, skill_level_before: 0, skill_level_after: 1, icon: "code", unit_code: "PS01", workshop_credits: 15, online_credits: 3, active: true, skill_group_id: 2},
  {name: "HTML5 & CSS3", tagline: "Basic web design", description: "Web design basics", duration_minutes: 90, skill_level_before: 0, skill_level_after: 2, icon: "code", unit_code: "WD01", workshop_credits: 15, online_credits: 3, active: true, skill_group_id: 4},
  {name: "Basic Bootstrap", tagline: "Make your websites and apps look amazing with Bootstrap", description: "Bootstrap!!", duration_minutes: 90, skill_level_before: 0, skill_level_after: 2, icon: "code", unit_code: "WD02", workshop_credits: 15, online_credits: nil, active: true, skill_group_id: 4},
  {name: "Ruby on Rails Introduction", tagline: "Programming", description: "RoR", duration_minutes: 180, skill_level_before: 0, skill_level_after: 1, icon: "code", unit_code: "WAD02", workshop_credits: 30, online_credits: 6, active: true, skill_group_id: 3},
  {name: "Rails Debugging", tagline: "Solving those errors", description: "Learn how to solve your own errors", duration_minutes: 90, skill_level_before: 0, skill_level_after: 1, icon: "code", unit_code: "WAD20", workshop_credits: 15, online_credits: nil, active: true, skill_group_id: 3},
  {name: "Google Maps for your app", tagline: "Integrating Google Maps", description: "Where are you?", duration_minutes: 90, skill_level_before: 1, skill_level_after: 2, icon: "code", unit_code: "WAD30", workshop_credits: 15, online_credits: 3, active: true, skill_group_id: 3},
  {name: "In-app messaging", tagline: "When you need to get in touch", description: "Allows your users to message each other", duration_minutes: 180, skill_level_before: 1, skill_level_after: 2, icon: "code", unit_code: "WAD31", workshop_credits: 30, online_credits: 6, active: true, skill_group_id: 3},
  {name: "Project - Build your first Rails app", tagline: "Build your own web app", description: "Build your own web app", duration_minutes: 180, skill_level_before: 0, skill_level_after: 1, icon: "code", unit_code: "WADP01", workshop_credits: 30, online_credits: 6, active: true, skill_group_id: 3}
])
UnitSkill.create!([
  {unit_id: 2, skill_id: 5, before_level: 0, after_level: 1},
  {unit_id: 1, skill_id: 2, before_level: 0, after_level: 1},
  {unit_id: 1, skill_id: 3, before_level: 0, after_level: 1},
  {unit_id: 4, skill_id: 4, before_level: 0, after_level: 1},
  {unit_id: 5, skill_id: 11, before_level: 1, after_level: 2},
  {unit_id: 6, skill_id: 1, before_level: 1, after_level: 2},
  {unit_id: 6, skill_id: 4, before_level: 1, after_level: 2},
  {unit_id: 6, skill_id: 6, before_level: 1, after_level: 2},
  {unit_id: 6, skill_id: 8, before_level: 1, after_level: 2},
  {unit_id: 6, skill_id: 9, before_level: 1, after_level: 2},
  {unit_id: 6, skill_id: 11, before_level: 0, after_level: 1},
  {unit_id: 7, skill_id: 4, before_level: 1, after_level: 2},
  {unit_id: 8, skill_id: 4, before_level: 2, after_level: 3},
  {unit_id: 8, skill_id: 8, before_level: 1, after_level: 2}
])
UserGoal.create!([
  {user_id: 5, goal_id: 1, notes: nil, achieved: nil},
  {user_id: 6, goal_id: 5, notes: nil, achieved: nil},
  {user_id: 7, goal_id: 5, notes: nil, achieved: nil},
  {user_id: 8, goal_id: 3, notes: nil, achieved: nil}
])
UserSkill.create!([
  {user_id: 5, skill_id: 6, level: 0},
  {user_id: 5, skill_id: 7, level: 1},
  {user_id: 5, skill_id: 8, level: 1},
  {user_id: 5, skill_id: 10, level: 0},
  {user_id: 5, skill_id: 11, level: 0},
  {user_id: 5, skill_id: 1, level: 3},
  {user_id: 5, skill_id: 2, level: 3},
  {user_id: 5, skill_id: 3, level: 3},
  {user_id: 5, skill_id: 4, level: 2},
  {user_id: 5, skill_id: 5, level: 1},
  {user_id: 5, skill_id: 9, level: 3},
  {user_id: 6, skill_id: 1, level: 0},
  {user_id: 6, skill_id: 2, level: 1},
  {user_id: 6, skill_id: 3, level: 1},
  {user_id: 6, skill_id: 4, level: 1},
  {user_id: 6, skill_id: 5, level: 1},
  {user_id: 6, skill_id: 6, level: 0},
  {user_id: 6, skill_id: 7, level: 0},
  {user_id: 6, skill_id: 8, level: 0},
  {user_id: 6, skill_id: 9, level: 0},
  {user_id: 6, skill_id: 10, level: 0},
  {user_id: 6, skill_id: 11, level: 0},
  {user_id: 7, skill_id: 1, level: 0},
  {user_id: 7, skill_id: 2, level: 0},
  {user_id: 7, skill_id: 3, level: 0},
  {user_id: 7, skill_id: 4, level: 0},
  {user_id: 7, skill_id: 5, level: 1},
  {user_id: 7, skill_id: 6, level: 0},
  {user_id: 7, skill_id: 7, level: 0},
  {user_id: 7, skill_id: 8, level: 0},
  {user_id: 7, skill_id: 9, level: 0},
  {user_id: 7, skill_id: 10, level: 0},
  {user_id: 7, skill_id: 11, level: 0},
  {user_id: 8, skill_id: 1, level: 0},
  {user_id: 8, skill_id: 2, level: 0},
  {user_id: 8, skill_id: 3, level: 0},
  {user_id: 8, skill_id: 5, level: 0},
  {user_id: 8, skill_id: 6, level: 0},
  {user_id: 8, skill_id: 7, level: 0},
  {user_id: 8, skill_id: 8, level: 0},
  {user_id: 8, skill_id: 9, level: 0},
  {user_id: 8, skill_id: 10, level: 0},
  {user_id: 8, skill_id: 11, level: 0},
  {user_id: 8, skill_id: 4, level: 1}
])
