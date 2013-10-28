# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

listenLiveStream = (timeout) ->
  setTimeout ->
    source = new EventSource '/update'
    source.addEventListener 'refresh', (e) -> 
      window.location.reload()
  , timeout

$ ->
  listenLiveStream 1000
