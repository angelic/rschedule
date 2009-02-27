function display_recurrence_options() {
  ['sf-recurrence-repeat-by', 'sf-recurrence-weekly', 'sf-recurrence-monthly', 'sf-recurrence-yearly'].each(Element.hide);
  switch($('sf-recurrence-type').value) {
  case "weekly": Element.show($('sf-recurrence-weekly')); break;
  case "monthly": ['sf-recurrence-repeat-by', 'sf-recurrence-monthly'].each(Element.show); break;
  case "yearly": ['sf-recurrence-repeat-by', 'sf-recurrence-yearly'].each(Element.show); break;
  }
}
