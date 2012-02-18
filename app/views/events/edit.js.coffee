$ ->
  $("#sf-add-event-content").html("<%=j render partial: 'edit_form', layout: false %>")
  $("#sf-add-event").show()
  @sf_general_binding()
  @sf_add_window()
  @set_alt_field('#show_start_date', '#calendar_event_start_date')
  @set_alt_field('#show_end_date', '#calendar_event_end_date')
