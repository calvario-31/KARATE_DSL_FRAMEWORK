Feature: Follow user
  Background:
    * def responseSchema = read('classpath:profiles/schema/profile.json')

    * def registerApi = callonce read('classpath:users/features/Register.feature')
    * def newUsername = registerApi.username

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'profiles', newUsername, 'follow'
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.profile == responseSchema
    And assert response.profile.following == true