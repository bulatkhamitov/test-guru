# README

## Список сущностей приложения TestGuru:

* Пользователь (User):

  * `id`: `integer`
  * `name`: `string`
  * `email`: `string`

* Тест (Test):

  * `id`: `integer`
  * `user_id`: `integer`
  * `category_id`: `integer`
  * `title`: `string`
  * `level`: `integer`

* Вопрос (Question):

  * `id`: `integer`
  * `test_id`: `integer`
  * `text`: `string`

* Ответ (Answer):

  * `id`: `integer`
  * `question_id`: `integer`
  * `correct`: `boolean`
  * `text`: `string`

* Категория (Category):

  * `id`: `integer`
  * `title`: `string`

* Тесты, пройденные пользователем (PassedTests):

  * `user_id`: `integer`
  * `test_id`: `integer`

## Связи между сущностями:

* Категория и Тест (связь *один ко многим*):

  * Каждый тест является частью одной категории
  * В каждую категорию может входить несколько тестов

* Пользователь (user) и Тест (связь *многие ко многим*):

  * Каждый пользователь может проходить несколько тестов
  * Каждый тест может проходиться нескольким  пользователями

* Пользователь (creator) и Тест (связь *один ко многим*):

  * Каждый пользователь может быть создателем нескольких тестов
  * Каждый тест является предметом авторства одног пользователя

* Вопрос и Тест (связь *один ко многим*):

  * Каждый вопрос входит в некий тест
  * Каждый тест содержит несколько вопросов

* Вопрос и Ответ (связь *один ко многим*):

  * Каждый вопрос содержит ответ (правильный и неправильный)
  * Каждый ответ относится к одному вопросу

*
