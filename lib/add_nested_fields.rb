module AddNestedFields
	module ViewHelper
		
		def add_nested_fields_for(form_builder, field, dom_id, *args)
			options = {
				:partial => field.to_s.singularize,
				:label => field.to_s.singularize.titleize,
				:object => field.to_s.classify.constantize.new
			}.merge(args.extract_options!)

			link_to_function("&nbsp;Add #{options[:label]}") do |page|
				form_builder.fields_for field, options[:object] , :child_index => 'NEW_RECORD' do |f|
			  	html = render(:partial => options[:partial], :locals => { :f => f })
					page << "$('#{dom_id}').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
				end
			end
		end

		def remove_nested_fields_for(form_builder, class_id)
			if form_builder.object.new_record?
				link_to_function("(remove)") do |page|
					page << "$(this).up('.#{class_id}').remove()"
				end
			else
				form_builder.hidden_field( :_delete, :value => false) + link_to_function("(remove)") do |page|
					page << "$(this).up('.#{class_id}').hide();$(this).previous().value = 1"
				end
			end
		end
		
	end
end
ActionView::Base.send(:include, AddNestedFields::ViewHelper)