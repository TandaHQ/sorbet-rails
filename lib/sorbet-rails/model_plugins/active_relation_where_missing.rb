# typed: strict

require 'sorbet-rails/model_plugins/base'

class SorbetRails::ModelPlugins::ActiveRelationWhereMissing < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    where_missing_module_name = self.model_module_name('AciveRelation_WhereMissing')
    where_missing_module_rbi = root.create_module(where_missing_module_name)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    model_relation_class_rbi.create_include(where_associatd_module_name)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    model_assoc_relation_rib.create_include(where_missing_module_name)

    where_missing_module_rbi.create_method(
      'missing',
      parameters: [
        Parameter.new('opts', type: 'T.untyped', default: nil),
        Parameter.new('*rest', type: 'T.untyped', default: nil),
      ],
      return_type: 'T.self_type',
    )
  end
end
