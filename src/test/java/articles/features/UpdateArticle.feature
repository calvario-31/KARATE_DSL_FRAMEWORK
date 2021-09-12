Feature: Update Article

  Background:
    * def bodyJson = Java.type('articles.faker.DataGenerator').generateNewArticle()

    * def responseSchema = read('classpath:articles/schema/article.json')

    * def createArticleApi = callonce read('CreateArticle.feature')
    * def slug = createArticleApi.slug

    Given url apiUrl
    And header Authorization = 'Token ' + token

  Scenario:
    Given path 'articles', slug
    And request bodyJson
    When method PUT
    Then status 200
    And match response.article == responseSchema