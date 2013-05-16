 # next line is to include it in all the model
 ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
 