Feature: Get comment
  Background:
    * def createCommentApi = callonce read('CreateComment.feature')
    * def slug = createCommentApi.slug

    * def responseSchema = read('commentSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'articles', slug, 'comments'
    When method GET
    Then status 200
    And assert responseTime < 1200
    And match each response.comments == responseSchema
