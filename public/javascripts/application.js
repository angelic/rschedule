function display_recurrence_options() {
  ['sf-recurrence-weekly', 'sf-recurrence-monthly', 'sf-recurrence-yearly'].each(Element.hide);
  switch($('sf-recurrence-type').value) {
  case "weekly": Element.show($('sf-recurrence-weekly')); break;
  case "monthly": Element.show($('sf-recurrence-monthly')); break;
  case "yearly": Element.show($('sf-recurrence-yearly')); break;
  }
}
