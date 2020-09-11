Feature: Start a new game
  Everybody wants to play this game

  Scenario: Start a new game succesfully
    When game starts, a text is displayed for the player
    When I start a new game
    Then I should be seeing "Welcome to fork game!"