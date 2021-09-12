Feature: Get user info
  Background:
    * def responseSchema = read('classpath:profiles/schema/profile.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'profiles', username
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match response.profile == responseSchema