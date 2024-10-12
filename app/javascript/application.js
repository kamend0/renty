// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus";
import "controllers";

import RailsNestedForm from "@stimulus-components/rails-nested-form";

// Nested forms from Stimulus-Components Nested Forms
const application = Application.start();
application.register("nested-form", RailsNestedForm);
