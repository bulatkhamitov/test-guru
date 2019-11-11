# README

## Предварительный список сущностей приложения TestGuru:

* Пользователь (User):

  * id: integer
  * name: string
  * email: string

* Тест (Test):

  * id: integer
  * *user_id: integer*
  * *categoriey_id: integer*
  * title: string
  * level: integer

* Вопрос (Question):

  * id: integer
  * *test_id: integer*
  * text: string

* Ответ (Answer):

  * id: integer
  * *question_id: integer*
  * correct: boolean
  * text: string

* Категория (Category):

  * id: integer
  * title: string

* Тесты, пройденные пользователем (PassedTests):

  * *user_id: integer*
  * *test_id: integer*
