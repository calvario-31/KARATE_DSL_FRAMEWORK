Feature: Update Article

  Background:
    * def bodyJson = Java.type('DataGenerator').generateNewArticle()

    * def responseSchema = read('articleSchema.json')

    * def createArticleApi = callonce read('CreateArticle.feature')
    * def slug = createArticleApi.slug

    Given url apiUrl
    And header Authorization = 'Token ' + token

  @regression
  Scenario:
    Given path 'articles', slug
    And request bodyJson
    When method PUT
    Then status 200
    And match response.article == responseSchema