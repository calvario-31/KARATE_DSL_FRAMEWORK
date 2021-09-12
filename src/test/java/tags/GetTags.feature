Feature: Get all tags

  Background:
    Given url apiUrl

  Scenario: Get all tags GET method
    Given path 'tags'
    When method GET
    Then status 200
    And assert responseTime < 6500
    And match each response.tags == "#string"