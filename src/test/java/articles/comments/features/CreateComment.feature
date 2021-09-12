Feature: Create comment
  Background:
    * def createArticleApi = callonce read('classpath:articles/features/CreateArticle.feature')
    * def slug = createArticleApi.slug

    * def bodyJson = Java.type('articles.comments.faker.DataGenerator').generateNewComment()

    * def responseSchema = read('classpath:articles/comments/schema/comment.json')

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'articles', slug, 'comments'
    And request bodyJson
    When method POST
    Then status 200
    And assert responseTime < 1200
    And match response.comment == responseSchema
    * def idComment = response.comment.id
