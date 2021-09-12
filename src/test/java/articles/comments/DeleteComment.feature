Feature: Delete comment

  Background:
    * def createCommentApi = callonce read('CreateComment.feature')
    * def slug = createCommentApi.slug
    * def idComment = createCommentApi.idComment

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'articles', slug, 'comments', idComment
    When method DELETE
    Then status 200
    And assert responseTime < 2400
