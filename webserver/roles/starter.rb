name "venkata"
description "An example Chef role"
run_list "recipe[weberever]"
override_attributes({
  "webserver_name" => " sunilkumar",
})
