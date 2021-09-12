Feature: Get user info
  Background:
    * def responseSchema = read('profileSchema.json')
    * def username = credentials.username

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'profiles', username
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response.profile == responseSchema