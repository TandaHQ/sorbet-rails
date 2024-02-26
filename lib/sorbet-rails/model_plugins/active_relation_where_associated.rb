# typed: strict

require 'sorbet-rails/model_plugins/base'

# This is mostly lifted from `active_relation_where_not.rb` in this same
# directory.
class SorbetRails::ModelPlugins::ActiveRelationWhereAssociated < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    ['associated', 'missing'].each do |method_name|
      where_module_name = self.model_module_name("AciveRelation_Where#{method_name.capitalize}")
      where_module_rbi = root.create_module(where_module_name)

      model_relation_class_rbi = root.create_class(self.model_relation_class_name)
      model_relation_class_rbi.create_include(where_module_name)

      model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
      model_assoc_relation_rbi.create_include(where_module_name)

      where_module_rbi.create_method(
        method_name,
        parameters: [
          Parameter.new('*associations', type: 'T.untyped', default: nil),
        ],
        return_type: 'T.self_type',
      )
    end
  end
end
