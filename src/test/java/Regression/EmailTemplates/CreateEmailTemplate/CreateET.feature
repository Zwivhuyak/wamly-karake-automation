Feature: Email Template
  Background:
    * def bodys = read('body.json')
    * def datasheet = read('data.csv')
    * def extractor = Java.type("common.Config")
  @Regression
  Scenario Outline: Create Email Template
    Given url 'https://api.uatwamly.co.za/wamly/v1//templates/fe187821-ca80-40c5-b265-9f24ab3754dd/create'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    * def j = Java.type('common.EmailTemplates')
    * def bodys2 = j.emailContent()
    * java.lang.Thread.sleep(600)

    Examples:
    |datasheet|