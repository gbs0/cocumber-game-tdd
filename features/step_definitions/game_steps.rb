When("Start new game") do
  @game = Game.new
  @game.start
end

Then("I should be told {string}") do |expected_answer|
  expect(@actual_answer).to eq(expected_answer)
end