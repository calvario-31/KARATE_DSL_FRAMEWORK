Feature: Create comment
  Background:
    * def createArticleApi = callonce read('../CreateArticle.feature')
    * def slug = createArticleApi.slug

    * def bodyJson = Java.type('DataGenerator').generateNewComment()

    * def responseSchema = read('commentSchema.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @smoke
  @regression
  Scenario:
    Given path 'articles', slug, 'comments'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 2400
    And match response.comment == responseSchema
    * def idComment = response.comment.id
