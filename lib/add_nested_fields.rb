module AddNestedFields
	module ViewHelper

		def add_nested_fields_for(form_builder, field, dom_id, *args)
			options = {
				:partial => field.to_s.singularize,
				:label => I18n.t('add_nested_fields.add') + ' ' + \
				          I18n.t(field, :scope => [:activerecord, :attributes, form_builder.object.class.to_s.underscore.downcase]).downcase,
				:object => field.to_s.classify.constantize.new
			}.merge(args.extract_options!)

			link_to_function("#{options[:label]}") do |page|
				form_builder.fields_for field, options[:object] , :child_index => 'NEW_RECORD' do |f|
				html = render(:partial => options[:partial], :locals => { :f => f })
					page << "$('#{dom_id}').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
				end
			end
		end

		def remove_nested_fields_for(form_builder, class_id, *args)
			options = {
				:label => I18n.t('add_nested_fields.remove'),
				:obj_name => I18n.t(form_builder.object.class.to_s.underscore.downcase, :scope => 'activerecord.models').downcase,
				:confirm => I18n.t('add_nested_fields.sure_delete'),
			}.merge(args.extract_options!)
			options[:confirm].sub!(/\{obj\}/, options[:obj_name]) unless options[:obj_name].nil?

			confirm = "if (confirm('#{options[:confirm]}'))"
			if form_builder.object.new_record?
				link_to_function(options[:label]) do |page|
					page << "#{confirm} $(this).up('.#{class_id}').remove()"
				end
			else
				form_builder.hidden_field( :_delete, :value => "0") + link_to_function(options[:label]) do |page|
					page << "#{confirm} $(this).up('.#{class_id}').hide();$(this).previous().value = 1"
				end
			end
		end

	end
end
ActionView::Base.send(:include, AddNestedFields::ViewHelper)
