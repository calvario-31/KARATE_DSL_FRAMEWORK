Feature: Get all articles
  Background:
    Given url apiUrl

  Scenario: Create an article POST method
    Given path 'articles'
    When method POST
    Then status 200
    And assert responseTime < 1200
  #TODO
    #And match response.articles == "#[]"
    #And match each response.articles == responseSchema