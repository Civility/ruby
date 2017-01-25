$ ->
# TRIX
  #перехватывает событиеt rix-attachment-add передает событие с картинкой
  document.addEventListener 'trix-attachment-add', (event) ->
    attachment = event.attachment
    if attachment.file #проверяем если это фаил картинка attachment есть
      return sendFile(attachment) # то передаем
    return
  #перехватывает событиеt trix-attachment-remove
  document.addEventListener 'trix-attachment-remove', (event) ->
    attachment = event.attachment
    deleteFile attachment # функция удаления attachment
# добавление картинки
  sendFile = (attachment) ->
    file = attachment.file
    form = new FormData # создаем форму в контент
    form.append 'Content-Type', file.type
    form.append 'picture[image]', file # передача картинки
    xhr = new XMLHttpRequest
    xhr.open 'POST', '/pictures', true # путь к картинки
# показывает progress bar
    xhr.upload.onprogress = (event) ->
      progress = undefined
      progress = event.loaded / event.total * 100
      attachment.setUploadProgress progress
# по окончании загрузки получить URL + ID
    xhr.onload = ->
      response = JSON.parse(@responseText)
      attachment.setAttributes
        url: response.url
        picture_id: response.picture_id
        href: response.url
# передаем форму
    xhr.send form

# удаление картинки по url
  deleteFile = (n) ->
    $.ajax
      type: 'DELETE'
      url: '/pictures/' + n.attachment.attributes.values.picture_id
      cache: false
      contentType: false
      processData: false

  return
