$ ->
  $("#sf-main-calendar").html("<%=j render partial: 'calendar', layout: false %>")
  $("#sf-small-calendar").html("<%=j render partial: 'small_calendar', layout: false %>")
  @sf_general_binding()
