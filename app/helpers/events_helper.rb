module EventsHelper
  def recurrence_types
    [["Does not repeat", :norepeat], 
        ["Weekdays (M-F)", :weekdays], 
        ["Daily", :daily],
        ["Weekly", :weekly], 
        ["Monthly", :monthly],
        ["Yearly", :yearly]]
  end
end
