module ForemanPuppetEnc
  module Extensions
    module Host
      extend ActiveSupport::Concern

      included do
        include_in_clone puppet: %i[config_groups host_config_groups host_classes]

        if ForemanPuppetEnc.extracted_from_core?
          # has_one :environment, through: :puppet
        else
          env_assoc = reflect_on_association(:environment)
          env_assoc&.instance_variable_set(:@class_name, 'ForemanPuppetEnc::Environment')
        end
      end
    end
  end
end
