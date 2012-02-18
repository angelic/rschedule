$ ->
<% if @calendar_event.errors.size > 0 %>
  $("#flash-new-error").html('<%= j @calendar_event.errors.full_messages.join %>')
<% else %>
  $("#sf-add-event").hide();
  $("#sf-selected-date-nav-link").click()
<% end %>
