Feature: Follow user
  Background:
    * def registerApi = callonce read('classpath:Register.feature')
    * def newUsername = registerApi.response.user.username

    * def responseSchema = read('../profileSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @regression
  @smoke
  Scenario:
    Given path 'profiles', newUsername, 'follow'
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.profile == responseSchema
    And assert response.profile.following == true