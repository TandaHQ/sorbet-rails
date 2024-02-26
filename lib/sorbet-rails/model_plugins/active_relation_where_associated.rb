# typed: strict

require 'sorbet-rails/model_plugins/base'

class SorbetRails::ModelPlugins::ActiveRelationWhereAssociated < SorbetRails::ModelPlugins::Base
  sig { override.parms(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    where_associated_module_name = self.model_module_name('AciveRelation_WhereAssociated')
    where_associated_module_rbi = root.create_module(where_associated_module_name)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    model_relation_class.rbi.create_include(where_associatd_module_name)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    model_assoc_relation_rib.create_include(where_associated_module_name)

    where_associated_module_rbi.create_method(
      'associated',
      parameters: [
        Parameter.new('opts', type: 'T.untyped', default: nil),
        Parameter.new('*rest', type: 'T.untyped', default: nil),
      ],
      return_type: 'T.self_type',
    )
  end
end
