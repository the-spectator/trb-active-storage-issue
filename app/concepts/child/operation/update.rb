# frozen_string_literal: true

module Child::Operation
  class Update < ApplicationOperation
    class Present < Trailblazer::Operation
      step Model(Child, :find_by)
      step Contract::Build(constant: Child::Contract::Form)
    end

    step Subprocess(Present), fast_track: true
    step Contract::Validate(key: :child)
    # step :clear_active_storage
    step Contract::Persist()
    fail :log_errors

    def clear_active_storage(ctx, **)
      ctx[:"contract.default"].id_card_image = hack(ctx[:"contract.default"].id_card_image)
      true
    end
  end
end
