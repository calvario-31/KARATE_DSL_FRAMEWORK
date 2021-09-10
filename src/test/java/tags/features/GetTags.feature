Feature: Get all tags
  Background:
    * def responseSchema = read('classpath:tags/schema/tags.json')

    Given url apiUrl

  Scenario: Get all tags GET method
    Given path 'tags'
    When method GET
    Then status 200
    And assert responseTime < 3500
    And match response == responseSchema
    And match each response.tags == "#string"