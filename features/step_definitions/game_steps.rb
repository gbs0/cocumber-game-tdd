require_relative '../../game.rb'

When('I start a new game') do
  @game = Game.new
  @game.start
end

Then("I should be seeing {string}") do |text|
  expect(@game.output).to include(text)
end

Then('It should draw an random enemy') do
  expect(@game.enemy.count).to eq(1)
end