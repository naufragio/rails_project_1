#Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#end

Blogger::Application.routes.draw do
  resources :articles
end

=begin


Setting up the Router
http://tutorials.jumpstartlab.com/projects/blogger.html#i5:-authentication

When a Rails server gets a request from a web browser it first goes to the router. 
The router decides what the request is trying to do, what resources it is trying to interact with.
 The router dissects a request based on the address it is requesting and other HTTP parameters 
 (like the request type of GET or PUT). Let’s open the router’s configuration file, config/routes.rb.


	This line tells Rails that we have a resource named articles and the router should expect 
	requests to follow the RESTful model of web interaction (REpresentational State Transfer).
	 The details don’t matter right now, but when you make a request like http://localhost:3000/articles/,
	 the router will understand you’re looking for a listing of the articles,
	  and http://localhost:3000/articles/new means you’re trying to create a new article.


	  a questo punto quando lanci bin/rake routes vedrai l'elenco di tutte le routes

	  The fourth column is where the route maps to in the applications.
	   Our example has articles#index, so requests will be sent to the index method of 
	   the ArticlesController class.
=end