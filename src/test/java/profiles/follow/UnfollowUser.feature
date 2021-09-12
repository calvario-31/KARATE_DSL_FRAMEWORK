Feature: Unfollow user
  Background:
    * def followUserApi = callonce read('FollowUser.feature')
    * def newUsername = followUserApi.newUsername

    * def responseSchema = read('../profileSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'profiles', newUsername, 'follow'
    When method DELETE
    Then status 200
    And assert responseTime < 1200
    And match response.profile == responseSchema
    And assert response.profile.following == false