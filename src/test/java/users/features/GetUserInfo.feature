Feature: Get user info

  Background:
    * def responseSchema = read('classpath:users/schema/userAuth.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario: Get user GET method
    Given path 'user'
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response == responseSchema
