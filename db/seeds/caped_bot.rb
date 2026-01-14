create_tenant "caped_bot"

yuri = find_or_create_user "Yuri Sidorov", "yuri@capedbot.com"

login_as yuri

projects = [
  "Listen With Me",
  "AI Form Fill",
  "Hidden Clauses",
  "Yuri Sidorov",
  "Template",
  "Sailing+",
  "Why Ruby?",
  "APISpecification",
  "Fizzy",
  "Capitalismo"
]

create_board("Caped Bot", access_to: [ yuri ]).tap do |fizzy|
  create_card("Setup Fizzy on fizzy.capedbot.com", description: "I need a planner to plan all the activity with other projects.", board: fizzy)
end

projects.each do |project|
  create_board(project, access_to: [ yuri ]).tap do |board|
    create_card("Plan the cards for #{project}", description: "I need to plan the next steps for the project.", board: board)
  end
end
