$ ->
<% if @calendar_event.errors.size > 0 %>
  $("flash-new-error").html(<%=j error_messages_for('calendar_event') %>)
<% else %>
  $("#sf-add-event").hide();
  $("#sf-selected-date-nav-link").click()
<% end %>
