Feature: Start a new game
  Everybody wants to start the game

  Scenario: Start a new game succesfully
    When I start a new game
    Then I should be seeing "Welcome to the matrix game!"