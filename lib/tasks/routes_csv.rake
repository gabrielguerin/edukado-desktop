# frozen_string_literal: true

namespace :routes do
  desc 'Print out all defined routes in CSV format. Target specific controller with CONTROLLER=x.'
  task csv: :environment do
    Rails.application.reload_routes!
    all_routes = Rails.application.routes.routes

    if ENV['CONTROLLER']
      all_routes = all_routes.select do |route|
        route.defaults[:controller] == ENV['CONTROLLER']
      end
    end

    routes = all_routes.collect do |route|
      reqs = route.requirements.dup
      reqs[:to] = route.app unless route.app.class.name.to_s =~ /^ActionDispatch::Routing/
      reqs = reqs.empty? ? '' : reqs.inspect

      {
        name: route.name.to_s,
        verb: route.verb.to_s,
        path: route.path,
        controller: route.requirements[:controller],
        action: route.requirements[:action]
      }
    end

    # Skip the route if it's internal info route
    # routes.reject! { |r| r[:path] =~ %r{/rails/info/properties|^/assets} }

    # name_width = routes.map{ |r| r[:name].length }.max
    # verb_width = routes.map{ |r| r[:verb].length }.max
    # path_width = routes.map{ |r| r[:path].length }.max

    puts 'controller,action,method,path,name'

    routes.each do |r|
      puts "#{r[:controller]},#{r[:action]},#{r[:verb]},#{r[:path]},#{r[:name]}"
    end
  end
end
