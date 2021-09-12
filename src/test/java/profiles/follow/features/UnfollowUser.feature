Feature: Unfollow user
  Background:
    * def responseSchema = read('classpath:profiles/schema/profile.json')

    * def followUserApi = callonce read('FollowUser.feature')
    * def newUsername = followUserApi.newUsername

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'profiles', newUsername, 'follow'
    When method DELETE
    Then status 200
    And assert responseTime < 1200
    And match response.profile == responseSchema
    And assert response.profile.following == false