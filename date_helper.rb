def distance_of_time_in_words(from_time, to_time = Time.now.to_i, include_seconds = false)
    distance_in_minutes = ((to_time - from_time)/60).round
    distance_in_seconds = (to_time - from_time).round
    
    case distance_in_minutes
        when 0..1
            return (distance_in_minutes==0) ? "less than a minute #{from_now_text(distance_in_seconds)}" : "1 minute #{from_now_text(distance_in_seconds)}" unless include_seconds
            case distance_in_seconds
                when 0..5   then "less than 5 seconds"
                when 6..10  then "less than 10 seconds"
                when 11..20 then "less than 20 seconds"
                when 21..40 then "half a minute"
                when 41..59 then "less than a minute"
                else             "1 minute"
            end
 
            when 2..45           then "#{distance_in_minutes} minutes"
            when 46..90          then "about 1 hour"
            when 90..1440        then "about #{(distance_in_minutes / 60).round} hours"
            when 1441..2880      then "1 day"
            when 2881..43220     then "#{(distance_in_minutes / 1440).round} days"
            when 43201..86400    then "about 1 month"
            when 86401..525960   then "#{(distance_in_minutes / 43200).round} months"
            when 525961..1051920 then "about 1 year"
        else                      "over #{(distance_in_minutes / 525600).round} years"
    end
end

def from_now_text(value)
    if value > 0
        "from now"
    else
        "ago"
    end
end