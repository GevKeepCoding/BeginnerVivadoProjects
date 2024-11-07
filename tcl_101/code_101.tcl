# Strings

set str "ab.c"

## Check if the string starts with a "." and ends with a "."
if {[regexp {^\..*\.$} $str]} {
    puts "String starts and ends with a dot"
} else {
    puts "String does not start and end with a dot"
}
or
if {[regexp {^\.} $str] || [regexp {\.$} $str]} {
    puts "String starts and ends with a dot"
} else {
    puts "String does not start and end with a dot"
}


set str "Hello, World!"
# 2. Check if a String Contains a Specific Word 
if {[regexp -all {World} $str]} {
    puts "String contains the word 'World'"
} else {
    puts "String does not contain the word 'World'"
}

---
set str "ab is good training company"

regsub "ab" $str "AB" str
or if we want to create new variable with replaced content
regsub "ab" $str "AB" str2

puts $str
puts $str2

---

redirect -var str [report_constriant -all_violators]


---
# while loop example with counter from 0 to 10
set counter 0
while {$counter < 10} {
    puts "Counter: $counter"
    incr counter
}
---
set lis "a b c"
lappend lis d
puts "length: [llength $lis]"
--
regexp "a" "bar"
regexp "b" "car"
---
regexp "\\d" "1"
or
regexp {\d} "1"
---