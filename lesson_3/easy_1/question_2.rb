=begin ! and ? do not inheretly have any meaning in Ruby syntax and are part of 
the method name. Don't fall into the trap thinking that ! is a destructive method!
=end

.map! # is destructive 
<< # is also destructive but no !

!= # means 'not equals'
? : # ternary operator for if..else
!!<some_object> # used to turn any object into their boolean equivalent
!<some_object> # is used to turn any object into the opposite of their boolean equivalent.
