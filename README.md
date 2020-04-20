# README

Steps To Reproduce bugs:

* Setup rails project
  * bundle install
  * bin/rails db:setup
  * bin/rails db:migrate

* Run the rspec example
  * bundle exec rspec spec/concepts/parent/operation/update_spec.rb

* Hack:
  * Defination of hack is found in app/concepts/application_operation.rb
  * To enable the hack => uncomment step :clear_active_storage in app/concepts/parent/operation/update.rb
