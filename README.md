# README

Steps To Reproduce bugs:

* Setup rails project
  * bundle install
  * bin/rails db:setup
  * bin/rails db:migrate

* Run the rspec example
  * bundle exec rspec spec/concepts/child/operation/update_spec.rb (less complex)
  * bundle exec rspec spec/concepts/parent/operation/update_spec.rb (litte complex)

* Hack:
  * Definition of hack is found in app/concepts/application_operation.rb
  * To enable the hack => uncomment step :clear_active_storage in operations
