# frozen_string_literal: true

module Mutant
  class AST
    module Regexp
      class Transformer
        # Transformer for root nodes
        class Root < self
          register :regexp_root_expression

          ExpressionToAST = Class.new(Recursive::ExpressionToAST)

          # Mapper from `Parser::AST::Node` to `Regexp::Expression`
          class ASTToExpression < Transformer::ASTToExpression

          private

            def transform
              ::Regexp::Expression::Root.build.tap do |root|
                root.expressions = subexpressions
              end
            end
          end # ASTToExpression
        end # Root
      end # Transformer
    end # Regexp
  end # AST
end # Mutant
