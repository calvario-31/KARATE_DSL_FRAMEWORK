Feature: Get user info

  Background:
    * def responseSchema = read('userAuthSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @regression
  Scenario: Get user GET method
    Given path 'user'
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema
