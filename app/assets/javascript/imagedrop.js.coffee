# imagedrop.js v0.0.2
# http://github/IAmNaN/image-drop
# Copyright (c) 2014 by Dave Gerton; Licensed MIT
# 
# Good for avatars and such.
# 
# Transforms simple file input fields (buttons)  into sophisticated looking
# drag and drop targets complete with preview image and placeholder text.
#
# Nothing fancy, it uses css to change the the size and appearance any file
# input control in a form and positions  preview and placeholder  divs over
# the top.  It uses js to show or hide the preview or placeholder given the
# current drag event.

jQuery ->
  $('*[data-imagedrop]').each ->
    new ImageDrop $(this)

class @ImageDrop
  constructor: (element) ->
    @element = element
    
    $(@element).find('input[type="file"]').change ->
      ImageDrop.readURL this

    $(@element).on 'dragenter', (event) ->
      $(this).addClass 'dragging'

    $(@element).on 'dragleave', (event) ->
      $(this).removeClass 'dragging'

    $(@element).on 'drop', (event) ->
      $(this).removeClass 'dragging'

  @readURL: (input) ->
    if input.files and input.files[0] and ImageDrop.checkFileType(input.files[0])
      reader = new FileReader()
    
      reader.target_elem = $(input).parent()
      reader.onload = (e) ->
      
        $(reader.target_elem).fadeOut 'fast', ->
          $(reader.target_elem).attr 'style', 'background-image: url(' + e.target.result + ')'
          $(reader.target_elem).fadeTo 1
        return

      reader.readAsDataURL input.files[0]
    return

  @checkFileType: (file) ->
    ext = file.name.substring(file.name.lastIndexOf('.')).toLowerCase()
    fileTypes = ".jpg , .png , .bmp, .gif , .webp , .svg"
    if (fileTypes.toLowerCase().indexOf(ext) < 0)
      alert("That doesn't appear to be an image file.")
      false
    else
      true
