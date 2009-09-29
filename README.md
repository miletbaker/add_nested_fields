AddNestedFields
===============

Adds two RJS helper methods to help work with accepts_nested_attributes_for and partials. Based on the method suggested by Marsvin on RailsForum.com: http://railsforum.com/viewtopic.php?pid=91229 

Installation
============

To install as a plugin (Rails)

	cd into your Rails root folder
	script/plugin install git://github.com/miletbaker/decimalizer.git
	
Usage
=====

Example form

	<% form_for @product do |f| %>
		...
		<% f.fields_for :product_variations do |prod_var| %>
				<%= render :partial => 'product_variation', :locals => { :f => prod_var } %>
		<% end %>
		<%= add_nested_fields_for(f, :product_variations, 'variations') %>
	<% end %>

example _product_variation.rb

	<li class="product_variation">
		...
			<%= remove_nested_fields_for(f, 'product_variation') %>
		...
	</li>

add_nested_fields_for(form_builder, attribute, dom_id, options = {})
--------------------------------------------------------------------
add_nested_fields_for adds a link to a javascript function that adds an additional nested model form, based on a partial.

*form_builder* is the current form_for builder

*attribute* is the property of the model that holds the relationship, i.e. in the link above Product has a has_many relationship to product_variations and hence :product_variations is its attribute.

*dom_id* is the id of the HTML element to insert the partial into the bottom of.

You can optionally also supply:

*:partial =>* defaults to the singular name of the attribute, in the above example 'product_variation'

*:label =>* defaults to "Add" plus the title case, singular name of the attribute

*:object =>* defaults to creating a new instance of an object using the camel-cased name of the attribute i.e. above that would be ProductVariation.new

remove_nested_fields_for(form_builder, dom_class)
------------------------------------------------
remove_nested_fields_for adds a link to a javascript function that if new, removes the partial, and if existing sets a hidden field _marking it's removal _delete=1, informing rails to delete the record and hides the partial.

*form_builder* is the fields_for builder, passed to the partial via the locals option.

*dom_class* is the class of the HTML element that forms the whole of the partial, the function searches up from the link for a HTML element with the matching class and removes or hides it as above.

Copyright (c) 2009 Go Tripod Ltd, released under the MIT license
