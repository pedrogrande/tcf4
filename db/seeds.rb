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
Goal.create!([
  {name: "Tech startup entrepreneur", description: "Startuper", icon: "rocket"},
  {name: "Web app developer", description: "Career", icon: "building"}
])
GoalSkill.create!([
  {goal_id: 1, skill_id: 1, required_skill_level: 1},
  {goal_id: 1, skill_id: 2, required_skill_level: 1},
  {goal_id: 1, skill_id: 3, required_skill_level: 1},
  {goal_id: 1, skill_id: 4, required_skill_level: 2},
  {goal_id: 2, skill_id: 1, required_skill_level: 3},
  {goal_id: 2, skill_id: 2, required_skill_level: 3},
  {goal_id: 2, skill_id: 3, required_skill_level: 3},
  {goal_id: 2, skill_id: 4, required_skill_level: 3}
])
GoalUnit.create!([
  {unit_id: 1, goal_id: 2},
  {unit_id: 2, goal_id: 2},
  {unit_id: 1, goal_id: 1},
  {unit_id: 2, goal_id: 1}
])
Skill.create!([
  {name: "Bootstrap", description: "Bootstrap", icon: "code", skill_group_id: 2},
  {name: "HTML5", description: "HTML5", icon: "code", skill_group_id: 2},
  {name: "Object Oriented Programming", description: "Programming", icon: "code", skill_group_id: 1},
  {name: "Ruby on Rails", description: "Ruby on Rails", icon: "code", skill_group_id: 3}
])
SkillGroup.create!([
  {name: "Programming Skills", description: "Programming", icon: "code"},
  {name: "Web Design", description: "Web design", icon: "code"},
  {name: "Web App Development", description: "Web app developmet", icon: "code"}
])
Unit.create!([
  {name: "HTML5 & CSS3", tagline: "Basic web design", description: "Basic web design", duration_minutes: 90, icon: "leaf", unit_code: "WD01", workshop_credits: 15, online_credits: 3, active: true, skill_group_id: 2},
  {name: "Programming Fundamentals", tagline: "Programming basics", description: "Programming basics", duration_minutes: 90, icon: "wrench", unit_code: "PS01", workshop_credits: 15, online_credits: 3, active: true, skill_group_id: 1}
])
UnitSkill.create!([
  {unit_id: 1, skill_id: 2, before_skill_level: 0, after_skill_level: 1},
  {unit_id: 2, skill_id: 3, before_skill_level: 0, after_skill_level: 1}
])

